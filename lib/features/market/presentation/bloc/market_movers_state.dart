import 'package:equatable/equatable.dart';

import '../../../../core/entities/market_mover.dart';
import '../../../../core/error/failure.dart';

sealed class MarketMoversState extends Equatable {
  const MarketMoversState();

  @override
  List<Object?> get props => [];
}

class MarketMoversInitial extends MarketMoversState {
  const MarketMoversInitial();
}

class MarketMoversLoading extends MarketMoversState {
  const MarketMoversLoading();
}

class MarketMoversLoaded extends MarketMoversState {
  final List<MarketMover> movers;

  const MarketMoversLoaded(this.movers);

  @override
  List<Object?> get props => [movers];
}

class MarketMoversError extends MarketMoversState {
  final Failure failure;

  const MarketMoversError(this.failure);

  @override
  List<Object?> get props => [failure];
}
