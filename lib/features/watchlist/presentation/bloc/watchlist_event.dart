import 'package:equatable/equatable.dart';

sealed class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

class WatchlistsRequested extends WatchlistEvent {
  const WatchlistsRequested();
}

class WatchlistCreateRequested extends WatchlistEvent {
  final String name;

  const WatchlistCreateRequested(this.name);

  @override
  List<Object?> get props => [name];
}

class WatchlistDeleteRequested extends WatchlistEvent {
  final String id;

  const WatchlistDeleteRequested(this.id);

  @override
  List<Object?> get props => [id];
}
