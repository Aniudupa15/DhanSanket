import 'package:integration_test/integration_test.dart';

import 'flows/auth_flow_test.dart' as auth_flow;
import 'flows/navigation_flow_test.dart' as navigation_flow;
import 'flows/stock_journey_test.dart' as stock_journey;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  auth_flow.main();
  navigation_flow.main();
  stock_journey.main();
}
