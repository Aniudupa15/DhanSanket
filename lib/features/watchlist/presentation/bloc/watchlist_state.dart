import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/watchlist.dart';

sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object?> get props => [];
}

class WatchlistInitial extends WatchlistState {
  const WatchlistInitial();
}

class WatchlistLoading extends WatchlistState {
  const WatchlistLoading();
}

class WatchlistLoaded extends WatchlistState {
  final List<Watchlist> watchlists;

  const WatchlistLoaded(this.watchlists);

  @override
  List<Object?> get props => [watchlists];
}

class WatchlistError extends WatchlistState {
  final Failure failure;

  const WatchlistError(this.failure);

  @override
  List<Object?> get props => [failure];
}
