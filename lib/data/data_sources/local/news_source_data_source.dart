import '../../models/news_source_model.dart';

abstract class NewsSourceDataSource {
  List<NewsSourceModel> getNewsSources();
}

class NewsSourceDataSourceImpl implements NewsSourceDataSource {
  final _newsSources = const <NewsSourceModel>[
    NewsSourceModel(
      title: 'Technote',
      feedUrl: 'https://technote.az/feed',
    ),
    NewsSourceModel(
      title: 'Apa.az',
      feedUrl: 'https://apa.az/az/rss',
      hasEnglishVersion: true,
      hasRussianVersion: true,
    ),
    NewsSourceModel(
      title: 'Report.az',
      feedUrl: 'https://report.az/rss/',
      hasRussianVersion: true,
      hasEnglishVersion: true,
    ),
  ];

  @override
  List<NewsSourceModel> getNewsSources() => _newsSources;
}
