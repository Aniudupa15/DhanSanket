import 'package:equatable/equatable.dart';

import '../../domain/entities/screener_filter.dart';

sealed class ScreenerEvent extends Equatable {
  const ScreenerEvent();

  @override
  List<Object?> get props => [];
}

class ScreenerSubmitted extends ScreenerEvent {
  final ScreenerFilter filter;

  const ScreenerSubmitted(this.filter);

  @override
  List<Object?> get props => [filter];
}
