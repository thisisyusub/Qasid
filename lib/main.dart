import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart';

import 'injection_container.dart';
import 'presentation/app.dart';

class News {
  String? source;
  String? title;
  String? url;
  String? description;
  String? pubDate;
}

final newsList = <News>[];

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
        final news = News();

        news.source = source;
        news.title = e.findElements('title').firstOrNull?.text;
        news.description = e.findElements('description').firstOrNull?.text;
        news.url = e
            .findElements('enclosure')
            .map((e) => e.getAttribute('url'))
            .firstOrNull;
        news.pubDate = e.findElements('pubDate').firstOrNull?.text;

        return news;
      },
    ).toList();
  }
}

extension WebFeedIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  // final result = await http.get(Uri.parse('https://report.az/az/rss'));

  // final news = FeedParser.parse(result.body);

  // final now = DateTime.now();
  // final today = DateTime(now.year, now.month, now.day);
  // print('today: $today');

  // for (var n in news) {
  //   if (n.pubDate != null) {
  //     final format = DateFormat('EEE, dd MMM yyyy HH:mm:ss Z');

  //     final parsedDate = format.parse(n.pubDate!);
  //     print('parsedDate: $parsedDate');

  //     if (parsedDate.isAfter(today)) {
  //       newsList.add(n);
  //     }
  //   }
  // }

  // print('size: ${newsList.length}');

  // final document = XmlDocument.parse(result.body);

  // var rss = document.findElements('rss').firstOrNull;
  // var rdf = document.findElements('rdf:RDF').firstOrNull;
  // var feedElement = document.findElements('feed').firstOrNull;

  // var feed;

  // if (rss != null || rdf != null) {
  //   feed = RssFeed.parse(result.body);
  // } else if (feedElement != null) {
  //   feed = AtomFeed.parse(result.body);
  // }

  // if (feed is RssFeed) {
  //   print('RSS');

  //   if (feed.items != null) {
  //     for (var item in feed.items!) {
  //       final now = DateTime.now();
  //       final today = DateTime(now.year, now.month, now.day);

  //       print('pubDate: ${item.pubDate}');
  //       print('today: $today');

  //       if (item.pubDate != null && item.pubDate!.isAfter(today)) {
  //         final news = News();

  //         news.title = item.title;
  //         news.url = item.enclosure?.url;
  //         news.description = item.description?.trim();
  //         news.source = feed.title;

  //         newsList.add(news);
  //       }
  //     }
  //   }
  // } else if (feed is AtomFeed) {
  //   print('Atom');
  // }

  // if (feed is RssFeed) {
  //   print('*** RSS ***\n');

  //   final first = feed.items!.first;

  //   print(first.link);

  //   final result = await http.get(Uri.parse(
  //       'https://apa.az/az/avropa/ukrayna-bas-qerargahi-rusiya-15-minden-artiq-herbci-itirib-693848'));

  //   print(result.body);

  //   final html = parser.parse(result.body);
  //   print(html.body?.getElementsByTagName('img').first.attributes['src']);
  // } else if (feed is AtomFeed) {
  //   print('*** ATOM ***\n');

  //   for (var item in feed.items!) {
  //     print(parser.parse(item.title).body?.text);

  //     print(item);
  //   }
  // }

  runApp(const MyApp());
}
