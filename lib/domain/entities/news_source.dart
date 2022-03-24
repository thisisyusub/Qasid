import 'package:equatable/equatable.dart';

class NewsSource extends Equatable {
  const NewsSource({
    required this.title,
    required this.feedUrl,
    this.hasEnglishVersion = false,
    this.hasRussianVersion = false,
  });

  final String title;
  final String feedUrl;
  final bool hasEnglishVersion;
  final bool hasRussianVersion;

  @override
  List<Object?> get props => [
        title,
        feedUrl,
        hasEnglishVersion,
        hasRussianVersion,
      ];
}
