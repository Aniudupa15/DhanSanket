import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/core/network/auth_session_notifier.dart';
import 'package:dhan_sanket/features/auth/domain/entities/user_profile.dart';
import 'package:dhan_sanket/features/auth/domain/repositories/auth_repository.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_event.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late AuthSessionNotifier sessionNotifier;

  final user = UserProfile(id: 'u1', email: 'test@example.com', displayName: 'Test', createdAt: DateTime(2026, 1, 1));

  setUp(() {
    repository = MockAuthRepository();
    sessionNotifier = AuthSessionNotifier();
  });

  tearDown(() {
    sessionNotifier.dispose();
  });

  blocTest<AuthBloc, AuthState>(
    'emits authenticated when restoreSession finds a valid session',
    build: () {
      when(() => repository.restoreSession()).thenAnswer((_) async => Success(user));
      return AuthBloc(repository: repository, sessionNotifier: sessionNotifier);
    },
    act: (bloc) => bloc.add(const AuthSessionRequested()),
    expect: () => [
      isA<AuthState>().having((s) => s.status, 'status', AuthStatus.authenticated).having((s) => s.user, 'user', user),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'emits unauthenticated when restoreSession finds no session',
    build: () {
      when(() => repository.restoreSession()).thenAnswer((_) async => const Success(null));
      return AuthBloc(repository: repository, sessionNotifier: sessionNotifier);
    },
    act: (bloc) => bloc.add(const AuthSessionRequested()),
    expect: () => [isA<AuthState>().having((s) => s.status, 'status', AuthStatus.unauthenticated)],
  );

  blocTest<AuthBloc, AuthState>(
    'login: emits authenticating then authenticated on success',
    build: () {
      when(() => repository.login(email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => Success(user));
      return AuthBloc(repository: repository, sessionNotifier: sessionNotifier);
    },
    act: (bloc) => bloc.add(const AuthLoginRequested(email: 'test@example.com', password: 'password123')),
    expect: () => [
      isA<AuthState>().having((s) => s.status, 'status', AuthStatus.authenticating),
      isA<AuthState>().having((s) => s.status, 'status', AuthStatus.authenticated).having((s) => s.user, 'user', user),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'login: emits authenticating then unauthenticated with a failure on error',
    build: () {
      when(() => repository.login(email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => const Error(UnauthorizedFailure('Invalid credentials')));
      return AuthBloc(repository: repository, sessionNotifier: sessionNotifier);
    },
    act: (bloc) => bloc.add(const AuthLoginRequested(email: 'test@example.com', password: 'wrong')),
    expect: () => [
      isA<AuthState>().having((s) => s.status, 'status', AuthStatus.authenticating),
      isA<AuthState>()
          .having((s) => s.status, 'status', AuthStatus.unauthenticated)
          .having((s) => s.failure?.message, 'failure message', 'Invalid credentials'),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'logout: emits unauthenticated',
    build: () {
      when(() => repository.logout()).thenAnswer((_) async => const Success(null));
      return AuthBloc(repository: repository, sessionNotifier: sessionNotifier);
    },
    act: (bloc) => bloc.add(const AuthLogoutRequested()),
    expect: () => [isA<AuthState>().having((s) => s.status, 'status', AuthStatus.unauthenticated)],
  );

  blocTest<AuthBloc, AuthState>(
    'reacts to AuthSessionNotifier by emitting sessionExpired',
    build: () => AuthBloc(repository: repository, sessionNotifier: sessionNotifier),
    act: (bloc) => sessionNotifier.notifySessionExpired(),
    wait: const Duration(milliseconds: 10),
    expect: () => [isA<AuthState>().having((s) => s.status, 'status', AuthStatus.sessionExpired)],
  );
}
