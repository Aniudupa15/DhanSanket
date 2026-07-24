import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/entities/news_article.dart';

class NewsArticleTile extends StatelessWidget {
  final NewsArticle article;

  const NewsArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.headline, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.summary != null)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(article.summary!, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
          Text(
            '${article.source} · ${DateFormat.yMMMd().add_jm().format(article.publishedAt.toLocal())}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      onTap: () => launchUrl(Uri.parse(article.url), mode: LaunchMode.externalApplication),
    );
  }
}
