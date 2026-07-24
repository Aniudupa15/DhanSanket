import 'package:equatable/equatable.dart';

sealed class CorporateActionsEvent extends Equatable {
  const CorporateActionsEvent();

  @override
  List<Object?> get props => [];
}

class CorporateActionsRequested extends CorporateActionsEvent {
  final String symbol;

  const CorporateActionsRequested(this.symbol);

  @override
  List<Object?> get props => [symbol];
}
