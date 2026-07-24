import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/watchlist_detail.dart';

sealed class WatchlistDetailState extends Equatable {
  const WatchlistDetailState();

  @override
  List<Object?> get props => [];
}

class WatchlistDetailInitial extends WatchlistDetailState {
  const WatchlistDetailInitial();
}

class WatchlistDetailLoading extends WatchlistDetailState {
  const WatchlistDetailLoading();
}

class WatchlistDetailLoaded extends WatchlistDetailState {
  final WatchlistDetail detail;

  const WatchlistDetailLoaded(this.detail);

  @override
  List<Object?> get props => [detail];
}

class WatchlistDetailError extends WatchlistDetailState {
  final Failure failure;

  const WatchlistDetailError(this.failure);

  @override
  List<Object?> get props => [failure];
}
