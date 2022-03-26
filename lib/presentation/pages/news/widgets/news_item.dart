import 'package:cached_network_image/cached_network_image.dart';
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

    return InkWell(
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
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
                const SizedBox(height: 10),
                if (news.imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: news.imageUrl!,
                      errorWidget: (_, __, ___) {
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
              ],
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
      ),
    );
  }
}
