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
  }) : super(key: key);

  final News news;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.title != null)
              Text(
                parse(news.title!).body?.text ?? '',
                style: appTheme.typography.title.copyWith(
                  color: appTheme.colors.secondaryColor,
                ),
              ),
            if (news.description != null && news.description!.isNotEmpty)
              const SizedBox(height: 5.0),
            if (news.description != null && news.description!.isNotEmpty)
              Text(
                news.description ?? '',
                style: appTheme.typography.subtitle.copyWith(
                  color: appTheme.colors.secondaryColor.withOpacity(0.7),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.left,
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
            if (news.source != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  news.source ?? '',
                  style: appTheme.typography.subtitle.copyWith(
                    color: appTheme.colors.secondaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
