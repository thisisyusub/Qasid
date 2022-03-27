import '../../models/news_source_model.dart';

abstract class NewsSourceDataSource {
  List<NewsSourceModel> getNewsSources();
}

class NewsSourceDataSourceImpl implements NewsSourceDataSource {
  final _newsSources = const <NewsSourceModel>[
    NewsSourceModel(
      title: 'Technote',
      dateParser: 'dd.M.yyyy HH:mm:ss',
      feedUrls: <String, String>{
        'az': 'https://technote.az/feed',
      },
    ),
    NewsSourceModel(
      title: 'Apa.az',
      dateParser: 'EEE, dd MMM yyyy HH:mm:ss Z',
      feedUrls: <String, String>{
        'az': 'https://apa.az/az/rss',
        'en': 'https://apa.az/en/rss',
        'ru': 'https://apa.az/ru/rss',
      },
    ),
    NewsSourceModel(
      title: 'Report.az',
      dateParser: 'EEE, dd MMM yyyy HH:mm:ss Z',
      feedUrls: <String, String>{
        'az': 'https://report.az/az/rss/',
        'en': 'https://report.az/en/rss/',
        'ru': 'https://report.az/ru/rss/',
      },
    ),
  ];

  @override
  List<NewsSourceModel> getNewsSources() => _newsSources;
}
