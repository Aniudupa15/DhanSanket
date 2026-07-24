import 'package:equatable/equatable.dart';

import '../../../../core/network/live_socket_service.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class DashboardRequested extends DashboardEvent {
  const DashboardRequested();
}

class DashboardRefreshRequested extends DashboardEvent {
  const DashboardRefreshRequested();
}

/// Internal - fed by the [LiveSocketService] subscription started in the
/// Bloc's constructor, not dispatched directly by the UI.
class DashboardLiveMarketSnapshotReceived extends DashboardEvent {
  final MarketSnapshotLiveEvent liveEvent;

  const DashboardLiveMarketSnapshotReceived(this.liveEvent);

  @override
  List<Object?> get props => [liveEvent];
}
