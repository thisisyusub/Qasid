import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/news_source.dart';
import '../../domain/repositories/news_source_repository.dart';
import '../data_sources/local/news_source_data_source.dart';

class NewsSourceRepositoryImpl implements NewsSourceRepository {
  NewsSourceRepositoryImpl(this.newsSourceDataSource);

  final NewsSourceDataSource newsSourceDataSource;

  @override
  Either<Failure, List<NewsSource>> getNewsSource() {
    try {
      return Success(newsSourceDataSource.getNewsSources());
    } catch (_) {
      return const Error(Failure.other());
    }
  }
}
