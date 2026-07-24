import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/dashboard_repository.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;

  DashboardBloc({required DashboardRepository repository}) : _repository = repository, super(const DashboardInitial()) {
    on<DashboardRequested>(_onRequested);
    on<DashboardRefreshRequested>(_onRequested);
  }

  Future<void> _onRequested(DashboardEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardLoading());
    final result = await _repository.getDashboard();
    switch (result) {
      case Success(data: final snapshot):
        emit(DashboardLoaded(snapshot));
      case Error(failure: final failure):
        emit(DashboardError(failure));
    }
  }
}
