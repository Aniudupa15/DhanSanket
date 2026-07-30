import 'package:equatable/equatable.dart';

sealed class MomentumEvent extends Equatable {
  const MomentumEvent();

  @override
  List<Object?> get props => [];
}

class MomentumRequested extends MomentumEvent {
  final int top;

  const MomentumRequested({this.top = 10});

  @override
  List<Object?> get props => [top];
}
