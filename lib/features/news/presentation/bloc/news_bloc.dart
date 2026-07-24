import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _repository;

  NewsBloc({required NewsRepository repository}) : _repository = repository, super(const NewsInitial()) {
    on<NewsRequested>(_onRequested);
  }

  Future<void> _onRequested(NewsRequested event, Emitter<NewsState> emit) async {
    emit(const NewsLoading());
    final result = await _repository.getNews(category: event.category);
    switch (result) {
      case Success(data: final articles):
        emit(NewsLoaded(articles, category: event.category));
      case Error(failure: final failure):
        emit(NewsError(failure));
    }
  }
}
