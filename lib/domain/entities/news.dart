import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News({
    this.source,
    this.title,
    this.imageUrl,
    this.description,
    this.pubDate,
    this.link,
  });

  final String? source;
  final String? title;
  final String? imageUrl;
  final String? description;
  final String? pubDate;
  final String? link;

  @override
  List<Object?> get props => [
        source,
        title,
        imageUrl,
        description,
        pubDate,
        link,
      ];
}
