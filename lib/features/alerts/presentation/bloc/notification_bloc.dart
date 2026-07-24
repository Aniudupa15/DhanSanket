import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/notification_repository.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _repository;

  NotificationBloc({required NotificationRepository repository})
    : _repository = repository,
      super(const NotificationInitial()) {
    on<NotificationsRequested>(_onRequested);
    on<NotificationMarkReadRequested>(_onMarkReadRequested);
  }

  Future<void> _onRequested(NotificationsRequested event, Emitter<NotificationState> emit) async {
    emit(const NotificationLoading());
    await _fetchAndEmit(emit);
  }

  Future<void> _onMarkReadRequested(NotificationMarkReadRequested event, Emitter<NotificationState> emit) async {
    final result = await _repository.markRead(event.id);
    if (result case Error(:final failure)) {
      emit(NotificationError(failure));
      return;
    }
    await _fetchAndEmit(emit);
  }

  Future<void> _fetchAndEmit(Emitter<NotificationState> emit) async {
    final result = await _repository.list();
    switch (result) {
      case Success(data: final notifications):
        emit(NotificationLoaded(notifications));
      case Error(failure: final failure):
        emit(NotificationError(failure));
    }
  }
}
