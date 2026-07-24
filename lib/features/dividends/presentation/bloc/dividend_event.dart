import 'package:equatable/equatable.dart';

sealed class DividendEvent extends Equatable {
  const DividendEvent();

  @override
  List<Object?> get props => [];
}

class DividendsRequested extends DividendEvent {
  final bool upcoming;
  final String sort;

  const DividendsRequested({this.upcoming = false, this.sort = 'ex_date'});

  @override
  List<Object?> get props => [upcoming, sort];
}
