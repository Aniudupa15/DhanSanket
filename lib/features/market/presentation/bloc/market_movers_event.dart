import 'package:equatable/equatable.dart';

import '../../domain/entities/mover_category.dart';

sealed class MarketMoversEvent extends Equatable {
  const MarketMoversEvent();

  @override
  List<Object?> get props => [];
}

class MarketMoversRequested extends MarketMoversEvent {
  final MoverCategory category;
  final String period;

  const MarketMoversRequested(this.category, {this.period = '1D'});

  @override
  List<Object?> get props => [category, period];
}
