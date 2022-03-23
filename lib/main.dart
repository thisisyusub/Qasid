import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart';

import 'core/app_theme/app_theme.dart';
import 'injection_container.dart' as di;
import 'presentation/pages/main/main_page.dart';

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
  await di.init();

  final result = await http.get(Uri.parse('https://technote.az/feed'));

  final document = XmlDocument.parse(result.body);

  var rss = document.findElements('rss').firstOrNull;
  var rdf = document.findElements('rdf:RDF').firstOrNull;
  var feedElement = document.findElements('feed').firstOrNull;

  var feed;

  if (rss != null || rdf != null) {
    feed = RssFeed.parse(result.body);
  } else if (feedElement != null) {
    feed = AtomFeed.parse(result.body);
  }

  if (feed is RssFeed) {
    print('RSS');

    if (feed.items != null) {
      for (var item in feed.items!) {
        final news = News();

        news.title = item.title;
        news.url = item.enclosure?.url;
        news.description = item.description?.trim();
        news.source = feed.title;

        newsList.add(news);
      }
    }
  } else if (feed is AtomFeed) {
    print('Atom');
  }

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: AppThemeData(
        colors: AppColorsData.light(),
        typography: AppTypographyData.regular(),
      ),
      child: Builder(builder: (context) {
        final appTheme = AppTheme.of(context);

        return MaterialApp(
          title: 'Qasid',
          theme: ThemeData(
            primaryColor: appTheme.colors.primaryColor,
            primaryColorDark: appTheme.colors.secondaryColor,
          ),
          home: const MainPage(),
        );
      }),
    );
  }
}
