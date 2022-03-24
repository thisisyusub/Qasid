import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'presentation/app.dart';

class News {
  String? source;
  String? title;
  String? url;
  String? description;
}

final newsList = <News>[];

extension WebFeedIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  // final result = await http.get(Uri.parse('https://technote.az/feed'));

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
  //       final news = News();

  //       news.title = item.title;
  //       news.url = item.enclosure?.url;
  //       news.description = item.description?.trim();
  //       news.source = feed.title;

  //       newsList.add(news);
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
