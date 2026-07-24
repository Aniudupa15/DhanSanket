import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/auth_session_notifier.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  late final StreamSubscription<void> _sessionExpiredSubscription;

  AuthBloc({required AuthRepository repository, required AuthSessionNotifier sessionNotifier})
    : _repository = repository,
      super(const AuthState()) {
    on<AuthSessionRequested>(_onSessionRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthSessionExpired>(_onSessionExpired);
    on<AuthProfileUpdateRequested>(_onProfileUpdateRequested);

    _sessionExpiredSubscription = sessionNotifier.onSessionExpired.listen((_) => add(const AuthSessionExpired()));
  }

  Future<void> _onSessionRequested(AuthSessionRequested event, Emitter<AuthState> emit) async {
    final result = await _repository.restoreSession();
    switch (result) {
      case Success(data: final user):
        emit(
          user != null
              ? state.copyWith(status: AuthStatus.authenticated, user: user, clearFailure: true)
              : state.copyWith(status: AuthStatus.unauthenticated, clearUser: true, clearFailure: true),
        );
      case Error():
        emit(state.copyWith(status: AuthStatus.unauthenticated, clearUser: true, clearFailure: true));
    }
  }

  Future<void> _onRegisterRequested(AuthRegisterRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.authenticating, clearFailure: true));
    final result = await _repository.register(
      email: event.email,
      password: event.password,
      displayName: event.displayName,
    );
    switch (result) {
      case Success(data: final user):
        emit(state.copyWith(status: AuthStatus.authenticated, user: user, clearFailure: true));
      case Error(failure: final failure):
        emit(state.copyWith(status: AuthStatus.unauthenticated, failure: failure));
    }
  }

  Future<void> _onLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.authenticating, clearFailure: true));
    final result = await _repository.login(email: event.email, password: event.password);
    switch (result) {
      case Success(data: final user):
        emit(state.copyWith(status: AuthStatus.authenticated, user: user, clearFailure: true));
      case Error(failure: final failure):
        emit(state.copyWith(status: AuthStatus.unauthenticated, failure: failure));
    }
  }

  Future<void> _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    await _repository.logout();
    emit(const AuthState(status: AuthStatus.unauthenticated));
  }

  Future<void> _onSessionExpired(AuthSessionExpired event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.sessionExpired, clearUser: true));
  }

  Future<void> _onProfileUpdateRequested(AuthProfileUpdateRequested event, Emitter<AuthState> emit) async {
    final result = await _repository.updateProfile(displayName: event.displayName, email: event.email);
    switch (result) {
      case Success(data: final user):
        emit(state.copyWith(user: user, clearFailure: true));
      case Error(failure: final failure):
        emit(state.copyWith(failure: failure));
    }
  }

  @override
  Future<void> close() {
    _sessionExpiredSubscription.cancel();
    return super.close();
  }
}
