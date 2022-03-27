import 'package:equatable/equatable.dart';

class NewsSource extends Equatable {
  const NewsSource({
    required this.title,
    required this.feedUrls,
    required this.dateParser,
  });

  final String title;
  final Map<String, dynamic> feedUrls;
  final String dateParser;

  @override
  List<Object?> get props => [
        title,
        feedUrls,
        dateParser,
      ];
}
