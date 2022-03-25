import 'package:equatable/equatable.dart';

class NewsSource extends Equatable {
  const NewsSource({
    required this.title,
    required this.feedUrl,
    required this.dateParser,
    this.hasEnglishVersion = false,
    this.hasRussianVersion = false,
  });

  final String title;
  final String feedUrl;
  final bool hasEnglishVersion;
  final bool hasRussianVersion;
  final String dateParser;

  @override
  List<Object?> get props => [
        title,
        feedUrl,
        dateParser,
        hasEnglishVersion,
        hasRussianVersion,
      ];
}
