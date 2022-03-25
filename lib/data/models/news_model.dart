import '../../domain/entities/news.dart';

class NewsModel extends News {
  const NewsModel({
    final String? source,
    final String? title,
    final String? imageUrl,
    final String? description,
    final String? pubDate,
    final String? link,
  }) : super(
          source: source,
          title: title,
          imageUrl: imageUrl,
          description: description,
          pubDate: pubDate,
          link: link,
        );
}
