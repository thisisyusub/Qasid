import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_theme/app_theme.dart';
import '../../news_detail/presentation/news_detail_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Hi, Kanan',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16.0),
              itemBuilder: (_, i) {
                return Container(
                  height: 30,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: i == 0 ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      'Sports',
                      style: TextStyle(
                        color: i == 0 ? Colors.white : Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
              },
              itemCount: 15,
            ),
          ),
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              children: const [
                NewsItem(),
                NewsItem(),
                NewsItem(),
                NewsItem(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: _index,
        onItemSelected: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            textAlign: TextAlign.center,
            activeColor: appTheme.colors.accentColor,
            inactiveColor: appTheme.colors.accentColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.bookmark),
            title: const Text('Saved'),
            textAlign: TextAlign.center,
            activeColor: Colors.black,
            inactiveColor: appTheme.colors.accentColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.settings),
            title: const Text('Settings'),
            textAlign: TextAlign.center,
            activeColor: Colors.black,
            inactiveColor: appTheme.colors.accentColor,
          ),
        ],
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'news',
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0.0, 2.0),
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'asssets/image.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                image:
                    'https://images.squarespace-cdn.com/content/v1/5ab44e4c75f9ee4074e83cf0/1522518697326-763OGPV7DW6KPRG3WDFM/6359032909966395992023423272_couple3.jpg',
              ),
              Positioned.fill(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16.0),
                      splashColor: Colors.black12,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return const NewsDetailPage(
                                url:
                                    'https://technote.az/suni-zeka-ve-elm/elon-musk-insanlarin-marsa-ne-zaman-ucacaqlari-meselesinde-yeni-tarix-teyin-edib',
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Zuzu və Kəni \n',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Apa.az',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.bookmark,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
