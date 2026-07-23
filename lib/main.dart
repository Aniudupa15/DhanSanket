import 'package:flutter/material.dart';

import 'bootstrap/app.dart';
import 'bootstrap/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();
  runApp(const App());
}
