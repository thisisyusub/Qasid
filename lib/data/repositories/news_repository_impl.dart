import 'package:intl/intl.dart';

import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/utils/feed_parser.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_source.dart';
import '../../domain/repositories/news_repository.dart';
import '../data_sources/local/news_source_data_source.dart';
import '../data_sources/local/preferences_data_source.dart';
import '../data_sources/remote/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({
    required this.preferencesDataSource,
    required this.newsSourceDataSource,
    required this.newsRemoteDataSource,
  });

  final PreferencesDataSource preferencesDataSource;
  final NewsSourceDataSource newsSourceDataSource;
  final NewsRemoteDataSource newsRemoteDataSource;

  @override
  Future<Either<Failure, List<News>>> fetchNewsList() async {
    try {
      final allNews = <News>[];

      /// first get users's selection that he/she want to get news from

      var languageCode = preferencesDataSource.locale;
      languageCode ??= 'az';

      final selectedSources = <NewsSource>[];
      selectedSources.addAll(newsSourceDataSource.getNewsSources());

      /// only todays news will be shown in the list
      /// that is why today's date needed to filter
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      for (var source in selectedSources) {
        try {
          final url = source.feedUrls[languageCode] as String?;

          if (url == null) {
            continue;
          }

          final xmlString = await newsRemoteDataSource.fetchFeed(url);

          final currentFeedNews = FeedParser.parse(xmlString);
          final dateFormatter = DateFormat(source.dateParser);

          /// filtering for today news in current source
          for (var news in currentFeedNews) {
            if (news.pubDate != null) {
              final formattedDate = dateFormatter.parse(news.pubDate!);

              if (formattedDate.isAfter(today)) {
                allNews.add(news);
              }
            } else {
              allNews.add(news);
            }
          }
        } catch (e) {
          continue;
        }
      }

      allNews.shuffle();
      return Success(allNews);
    } catch (e) {
      return const Error(Failure.other());
    }
  }
}
