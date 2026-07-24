import 'package:equatable/equatable.dart';

import '../../../../core/entities/news_article.dart';
import '../../../../core/error/failure.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsLoaded extends NewsState {
  final List<NewsArticle> articles;
  final NewsCategory? category;

  const NewsLoaded(this.articles, {this.category});

  @override
  List<Object?> get props => [articles, category];
}

class NewsError extends NewsState {
  final Failure failure;

  const NewsError(this.failure);

  @override
  List<Object?> get props => [failure];
}
