import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/entities/news_article.dart';

class LatestNewsPreview extends StatelessWidget {
  final List<NewsArticle> articles;

  const LatestNewsPreview({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) return const SizedBox.shrink();
    final formatter = DateFormat('MMM d, h:mm a');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Latest News', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...articles.map((article) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(article.headline, maxLines: 2, overflow: TextOverflow.ellipsis),
              subtitle: Text('${article.source} - ${formatter.format(article.publishedAt)}'),
            );
          }),
        ],
      ),
    );
  }
}
