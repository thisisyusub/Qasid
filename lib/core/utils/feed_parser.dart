import 'package:xml/xml.dart';

import '../../domain/entities/news.dart';

extension WebFeedIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

class FeedParser {
  static List<News> parse(String xmlString) {
    var document = XmlDocument.parse(xmlString);

    var rss = document.findElements('rss').firstOrNull;
    var rdf = document.findElements('rdf:RDF').firstOrNull;

    if (rss == null && rdf == null) {
      return [];
    }

    var channelElement = (rss ?? rdf)!.findElements('channel').firstOrNull;

    if (channelElement == null) {
      return [];
    }

    final source = channelElement.findElements('title').firstOrNull?.text;

    return (rdf ?? channelElement).findElements('item').map(
      (e) {
        final news = News(
          source: source,
          title: e.findElements('title').firstOrNull?.text.trim(),
          description: e.findElements('description').firstOrNull?.text.trim(),
          imageUrl: e
              .findElements('enclosure')
              .map((e) => e.getAttribute('url'))
              .firstOrNull,
          pubDate: e.findElements('pubDate').firstOrNull?.text,
        );

        return news;
      },
    ).toList();
  }
}
