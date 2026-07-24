import 'package:equatable/equatable.dart';

import '../../../../core/entities/news_article.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class NewsRequested extends NewsEvent {
  final NewsCategory? category;

  const NewsRequested({this.category});

  @override
  List<Object?> get props => [category];
}
