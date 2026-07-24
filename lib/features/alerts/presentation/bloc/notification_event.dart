import 'package:equatable/equatable.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class NotificationsRequested extends NotificationEvent {
  const NotificationsRequested();
}

class NotificationMarkReadRequested extends NotificationEvent {
  final String id;

  const NotificationMarkReadRequested(this.id);

  @override
  List<Object?> get props => [id];
}
