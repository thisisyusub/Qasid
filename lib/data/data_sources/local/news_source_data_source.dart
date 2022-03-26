import '../../models/news_source_model.dart';

abstract class NewsSourceDataSource {
  List<NewsSourceModel> getNewsSources();
}

class NewsSourceDataSourceImpl implements NewsSourceDataSource {
  final _newsSources = const <NewsSourceModel>[
    NewsSourceModel(
      title: 'Technote',
      feedUrl: 'https://technote.az/feed',
      dateParser: 'dd.M.yyyy HH:mm:ss',
    ),
    NewsSourceModel(
      title: 'Apa.az',
      feedUrl: 'https://apa.az/az/rss',
      dateParser: 'EEE, dd MMM yyyy HH:mm:ss Z',
      hasEnglishVersion: true,
      hasRussianVersion: true,
    ),
    NewsSourceModel(
      title: 'Report.az',
      feedUrl: 'https://report.az/az/rss/',
      dateParser: 'EEE, dd MMM yyyy HH:mm:ss Z',
      hasRussianVersion: true,
      hasEnglishVersion: true,
    ),
  ];

  @override
  List<NewsSourceModel> getNewsSources() => _newsSources;
}
