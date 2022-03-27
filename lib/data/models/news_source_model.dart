import '../../domain/entities/news_source.dart';

class NewsSourceModel extends NewsSource {
  const NewsSourceModel({
    required String title,
    required String dateParser,
    required Map<String, dynamic> feedUrls,
  }) : super(
          title: title,
          feedUrls: feedUrls,
          dateParser: dateParser,
        );

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) {
    return NewsSourceModel(
      title: json['title'],
      feedUrls: json['feedUrls'],
      dateParser: json['dateParser'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['title'] = title;
    map['feedUrls'] = feedUrls;
    map['dateParser'] = dateParser;

    return map;
  }
}
