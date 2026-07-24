import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/features/auth/domain/entities/user_profile.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_event.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_state.dart';
import 'package:dhan_sanket/features/auth/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockAuthBloc authBloc;

  final user = UserProfile(
    id: 'u1',
    email: 'test@example.com',
    displayName: 'Test User',
    createdAt: DateTime(2026, 1, 1),
  );

  setUpAll(() {
    registerFallbackValue(const AuthSessionExpired());
  });

  setUp(() {
    authBloc = MockAuthBloc();
    final state = AuthState(status: AuthStatus.authenticated, user: user);
    whenListen(authBloc, Stream<AuthState>.empty(), initialState: state);
  });

  Widget buildSubject() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(value: authBloc, child: const ProfilePage()),
    );
  }

  testWidgets('prefills the form with the current user', (tester) async {
    await tester.pumpWidget(buildSubject());

    expect(find.text('Test User'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);
  });

  testWidgets('dispatches AuthProfileUpdateRequested with edited values', (tester) async {
    await tester.pumpWidget(buildSubject());

    await tester.enterText(find.byType(TextFormField).first, 'New Name');
    await tester.tap(find.text('Save changes'));
    await tester.pump();

    verify(
      () => authBloc.add(const AuthProfileUpdateRequested(displayName: 'New Name', email: 'test@example.com')),
    ).called(1);
  });

  testWidgets('confirming the logout dialog dispatches AuthLogoutRequested', (tester) async {
    await tester.pumpWidget(buildSubject());

    await tester.tap(find.text('Log out'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Log out'));
    await tester.pumpAndSettle();

    verify(() => authBloc.add(const AuthLogoutRequested())).called(1);
  });
}
