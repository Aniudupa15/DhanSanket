import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_event.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_state.dart';
import 'package:dhan_sanket/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockAuthBloc authBloc;

  setUpAll(() {
    // AuthEvent is sealed - can't be Fake-implemented outside its library -
    // register a concrete subclass instance as the fallback instead.
    registerFallbackValue(const AuthSessionExpired());
  });

  setUp(() {
    authBloc = MockAuthBloc();
    whenListen(authBloc, const Stream<AuthState>.empty(), initialState: const AuthState());
  });

  Widget buildSubject() {
    return MaterialApp(home: BlocProvider<AuthBloc>.value(value: authBloc, child: const LoginPage()));
  }

  testWidgets('shows validation errors when submitting an empty form', (tester) async {
    await tester.pumpWidget(buildSubject());

    await tester.tap(find.text('Log in'));
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
    verifyNever(() => authBloc.add(any()));
  });

  testWidgets('dispatches AuthLoginRequested with the entered credentials', (tester) async {
    await tester.pumpWidget(buildSubject());

    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.tap(find.text('Log in'));
    await tester.pump();

    verify(
      () => authBloc.add(const AuthLoginRequested(email: 'test@example.com', password: 'password123')),
    ).called(1);
  });

  testWidgets('shows a loading indicator while authenticating', (tester) async {
    whenListen(
      authBloc,
      const Stream<AuthState>.empty(),
      initialState: const AuthState(status: AuthStatus.authenticating),
    );

    await tester.pumpWidget(buildSubject());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
