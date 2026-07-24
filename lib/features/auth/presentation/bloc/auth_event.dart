import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Fired once at app launch (from the splash screen) to check for a
/// restorable session.
class AuthSessionRequested extends AuthEvent {
  const AuthSessionRequested();
}

class AuthRegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String displayName;

  const AuthRegisterRequested({required this.email, required this.password, required this.displayName});

  @override
  List<Object?> get props => [email, password, displayName];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

class AuthProfileUpdateRequested extends AuthEvent {
  final String? displayName;
  final String? email;

  const AuthProfileUpdateRequested({this.displayName, this.email});

  @override
  List<Object?> get props => [displayName, email];
}

/// Internal event fired when [AuthSessionNotifier] reports that a token
/// refresh failed irrecoverably (see core/network/token_refresh_coordinator.dart).
class AuthSessionExpired extends AuthEvent {
  const AuthSessionExpired();
}
