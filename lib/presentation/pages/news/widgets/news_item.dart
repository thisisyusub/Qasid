import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:theme/theme.dart';

import '../../../../domain/entities/news.dart';
import '../../../bloc/theme/theme_cubit.dart';
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
    final themeMode = context.read<ThemeCubit>().state;

    final subtitleColor = themeMode == ThemeMode.light
        ? appTheme.colors.accentColor
        : Colors.white;

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
        padding: const EdgeInsets.only(
          top: 25.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            if (news.title != null) const SizedBox(height: 12),
            if (news.title != null)
              Text(
                parse(news.title!).body?.text ?? '',
                style: appTheme.typography.title,
              ),
            if (news.description != null && news.description!.isNotEmpty)
              const SizedBox(height: 8.0),
            if (news.description != null && news.description!.isNotEmpty)
              Text(
                news.description ?? '',
                style: appTheme.typography.subtitle.copyWith(
                  color: subtitleColor,
                ),
                textAlign: TextAlign.left,
              ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                if (news.source != null)
                  Text(
                    news.source ?? '',
                    style: appTheme.typography.caption.copyWith(
                      color: subtitleColor,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
