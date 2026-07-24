import 'package:equatable/equatable.dart';

sealed class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

class PortfoliosRequested extends PortfolioEvent {
  const PortfoliosRequested();
}

class PortfolioCreateRequested extends PortfolioEvent {
  final String name;

  const PortfolioCreateRequested(this.name);

  @override
  List<Object?> get props => [name];
}
