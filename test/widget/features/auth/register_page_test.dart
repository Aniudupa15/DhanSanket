import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_event.dart';
import 'package:dhan_sanket/features/auth/presentation/bloc/auth_state.dart';
import 'package:dhan_sanket/features/auth/presentation/pages/register_page.dart';
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
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(value: authBloc, child: const RegisterPage()),
    );
  }

  testWidgets('shows validation errors when submitting an empty form', (tester) async {
    await tester.pumpWidget(buildSubject());

    await tester.tap(find.text('Register'));
    await tester.pump();

    expect(find.text('Enter a name (1-128 characters)'), findsOneWidget);
    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('Password must be 8-72 characters'), findsOneWidget);
    verifyNever(() => authBloc.add(any()));
  });

  testWidgets('dispatches AuthRegisterRequested with the entered values', (tester) async {
    await tester.pumpWidget(buildSubject());

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Test User');
    await tester.enterText(fields.at(1), 'test@example.com');
    await tester.enterText(fields.at(2), 'password123');
    await tester.tap(find.text('Register'));
    await tester.pump();

    verify(
      () => authBloc.add(
        const AuthRegisterRequested(email: 'test@example.com', password: 'password123', displayName: 'Test User'),
      ),
    ).called(1);
  });
}
