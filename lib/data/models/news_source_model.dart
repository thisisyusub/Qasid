import '../../domain/entities/news_source.dart';

class NewsSourceModel extends NewsSource {
  const NewsSourceModel({
    required String title,
    required String feedUrl,
    required String dateParser,
    bool hasEnglishVersion = false,
    bool hasRussianVersion = false,
  }) : super(
          title: title,
          feedUrl: feedUrl,
          dateParser: dateParser,
          hasEnglishVersion: hasEnglishVersion,
          hasRussianVersion: hasRussianVersion,
        );

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) {
    return NewsSourceModel(
      title: json['title'],
      feedUrl: json['feedUrl'],
      dateParser: json['dateParser'],
      hasEnglishVersion: json['hasEnglishVersion'],
      hasRussianVersion: json['hasRussianVersion'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['title'] = title;
    map['feedUrl'] = feedUrl;
    map['dateParser'] = dateParser;
    map['hasEnglishVersion'] = hasEnglishVersion;
    map['hasRussianVersion'] = hasRussianVersion;

    return map;
  }
}
