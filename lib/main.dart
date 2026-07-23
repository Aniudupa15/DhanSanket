// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/nav_view.dart';

void main() {
  runApp(const StockPredictionApp());
}

class StockPredictionApp extends StatelessWidget {
  const StockPredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stock Predictor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF007bff),
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color(0xFF007bff),
          secondary: Colors.amber,
          background: const Color(0xFF0D1117),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E2746),
        ),
        cardColor: const Color(0xFF161B22),
      ),
      home: NavView(),
    );
  }
}