import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:theme/theme.dart';

import '../../../../domain/entities/news.dart';
import '../../news_detail/news_detail_page.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.news,
    required this.constraints,
  }) : super(key: key);

  final News news;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (news.title != null)
                Text(
                  parse(news.title!).body?.text ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (news.description != null && news.description!.isNotEmpty)
                const SizedBox(height: 5.0),
              if (news.description != null && news.description!.isNotEmpty)
                const Divider(
                  thickness: .5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                ),
              if (news.description != null && news.description!.isNotEmpty)
                Text(
                  news.description ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SizedBox(
            width: constraints.maxWidth * 0.9,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder_logo.png',
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    fit: BoxFit.cover,
                    image: news.imageUrl ?? '',
                  ),
                ),
                Positioned.fill(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black12,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        splashColor: Colors.black26,
                        onTap: () {
                          if (news.link != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  return NewsDetailPage(
                                    title: news.source ?? '',
                                    url: news.link!,
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                if (false)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: appTheme.colors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: const Center(
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
        if (news.source != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.source ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
