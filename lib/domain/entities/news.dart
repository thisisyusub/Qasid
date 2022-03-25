import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News({
    this.source,
    this.title,
    this.url,
    this.description,
    this.pubDate,
  });

  final String? source;
  final String? title;
  final String? url;
  final String? description;
  final String? pubDate;

  @override
  List<Object?> get props => [
        source,
        title,
        url,
        description,
        pubDate,
      ];
}
