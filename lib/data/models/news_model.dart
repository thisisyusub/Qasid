import '../../domain/entities/news.dart';

class NewsModel extends News {
  const NewsModel({
    final String? source,
    final String? title,
    final String? url,
    final String? description,
    final String? pubDate,
  }) : super(
          source: source,
          title: title,
          url: url,
          description: description,
          pubDate: pubDate,
        );
}
