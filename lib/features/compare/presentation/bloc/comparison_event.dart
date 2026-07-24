import 'package:equatable/equatable.dart';

sealed class ComparisonEvent extends Equatable {
  const ComparisonEvent();

  @override
  List<Object?> get props => [];
}

class ComparisonRequested extends ComparisonEvent {
  final List<String> symbols;

  const ComparisonRequested(this.symbols);

  @override
  List<Object?> get props => [symbols];
}
