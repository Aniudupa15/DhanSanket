import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../helpers/test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Flow Integration Tests', () {
    testWidgets('App launches to Login screen when unauthenticated', (tester) async {
      await TestHelpers.bootApp(tester);
      expect(find.text('DhanSanket'), findsWidgets);
      expect(find.text('Log in'), findsOneWidget);
    });

    testWidgets('Form validation shows error on empty login submission', (tester) async {
      await TestHelpers.bootApp(tester);
      await tester.tap(find.text('Log in'));
      await tester.pumpAndSettle();
      expect(find.text('Enter a valid email address'), findsOneWidget);
    });

    testWidgets('User can navigate to Register screen and back', (tester) async {
      await TestHelpers.bootApp(tester);
      await tester.tap(find.text("Don't have an account? Register"));
      await tester.pumpAndSettle();
      expect(find.text('Register'), findsWidgets);

      await tester.tap(find.text('Already have an account? Log in'));
      await tester.pumpAndSettle();
      expect(find.text('Log in'), findsOneWidget);
    });
  });
}
