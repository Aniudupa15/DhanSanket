import 'package:equatable/equatable.dart';

import '../../../../core/network/live_socket_service.dart';
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

/// Internal - fed by the [LiveSocketService] subscription started in the
/// Bloc's constructor, not dispatched directly by the UI.
class MarketMoversLiveSnapshotReceived extends MarketMoversEvent {
  final MarketSnapshotLiveEvent liveEvent;

  const MarketMoversLiveSnapshotReceived(this.liveEvent);

  @override
  List<Object?> get props => [liveEvent];
}
