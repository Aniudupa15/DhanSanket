import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/news_article.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import '../widgets/news_article_tile.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  NewsCategory? _category;

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(const NewsRequested());
  }

  void _selectCategory(NewsCategory? category) {
    setState(() => _category = category);
    context.read<NewsBloc>().add(NewsRequested(category: category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _CategoryChip(label: 'All', selected: _category == null, onSelected: () => _selectCategory(null)),
                  for (final category in NewsCategory.values)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: _CategoryChip(
                        label: _labelFor(category),
                        selected: _category == category,
                        onSelected: () => _selectCategory(category),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return switch (state) {
                  NewsInitial() || NewsLoading() => const AppLoadingView(),
                  NewsError(:final failure) => AppErrorView(
                    message: failure.message,
                    onRetry: () => context.read<NewsBloc>().add(NewsRequested(category: _category)),
                  ),
                  NewsLoaded(:final articles) =>
                    articles.isEmpty
                        ? const Center(child: Text('No news right now.'))
                        : RefreshIndicator(
                            onRefresh: () async => context.read<NewsBloc>().add(NewsRequested(category: _category)),
                            child: ListView.builder(
                              itemCount: articles.length,
                              itemBuilder: (context, index) => NewsArticleTile(article: articles[index]),
                            ),
                          ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  String _labelFor(NewsCategory category) {
    return switch (category) {
      NewsCategory.market => 'Market',
      NewsCategory.company => 'Company',
      NewsCategory.economy => 'Economy',
      NewsCategory.regulation => 'Regulation',
      NewsCategory.sector => 'Sector',
    };
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const _CategoryChip({required this.label, required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(label: Text(label), selected: selected, onSelected: (_) => onSelected());
  }
}
