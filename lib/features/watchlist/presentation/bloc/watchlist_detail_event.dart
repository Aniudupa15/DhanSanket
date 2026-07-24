import 'package:equatable/equatable.dart';

sealed class WatchlistDetailEvent extends Equatable {
  const WatchlistDetailEvent();

  @override
  List<Object?> get props => [];
}

class WatchlistDetailRequested extends WatchlistDetailEvent {
  final String id;

  const WatchlistDetailRequested(this.id);

  @override
  List<Object?> get props => [id];
}

class WatchlistItemAddRequested extends WatchlistDetailEvent {
  final String id;
  final String symbol;

  const WatchlistItemAddRequested(this.id, this.symbol);

  @override
  List<Object?> get props => [id, symbol];
}

class WatchlistItemRemoveRequested extends WatchlistDetailEvent {
  final String id;
  final String symbol;

  const WatchlistItemRemoveRequested(this.id, this.symbol);

  @override
  List<Object?> get props => [id, symbol];
}
