import '../../domain/entities/news_source.dart';

class NewsSourceModel extends NewsSource {
  const NewsSourceModel({
    required String title,
    required String feedUrl,
    bool hasEnglishVersion = false,
    bool hasRussianVersion = false,
  }) : super(
          title: title,
          feedUrl: feedUrl,
          hasEnglishVersion: hasEnglishVersion,
          hasRussianVersion: hasRussianVersion,
        );

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) {
    return NewsSourceModel(
      title: json['title'],
      feedUrl: json['feedUrl'],
      hasEnglishVersion: json['hasEnglishVersion'],
      hasRussianVersion: json['hasRussianVersion'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['title'] = title;
    map['feedUrl'] = feedUrl;
    map['hasEnglishVersion'] = hasEnglishVersion;
    map['hasRussianVersion'] = hasRussianVersion;

    return map;
  }
}
