import 'package:equatable/equatable.dart';

import '../../../../core/entities/news_article.dart';
import '../../../../core/error/failure.dart';

sealed class StockNewsState extends Equatable {
  const StockNewsState();

  @override
  List<Object?> get props => [];
}

class StockNewsInitial extends StockNewsState {
  const StockNewsInitial();
}

class StockNewsLoading extends StockNewsState {
  const StockNewsLoading();
}

class StockNewsLoaded extends StockNewsState {
  final List<NewsArticle> articles;

  const StockNewsLoaded(this.articles);

  @override
  List<Object?> get props => [articles];
}

class StockNewsError extends StockNewsState {
  final Failure failure;

  const StockNewsError(this.failure);

  @override
  List<Object?> get props => [failure];
}
