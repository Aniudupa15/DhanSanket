import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user_profile.dart';

enum AuthStatus { initial, authenticating, authenticated, unauthenticated, sessionExpired }

class AuthState extends Equatable {
  final AuthStatus status;
  final UserProfile? user;
  final Failure? failure;

  const AuthState({this.status = AuthStatus.initial, this.user, this.failure});

  AuthState copyWith({
    AuthStatus? status,
    UserProfile? user,
    Failure? failure,
    bool clearUser = false,
    bool clearFailure = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: clearUser ? null : (user ?? this.user),
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [status, user, failure];
}
