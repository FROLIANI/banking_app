import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF3F5BD9); // close to your UI blue
  static const Color bg = Color(0xFFF7F8FC);

  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: primary),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      textTheme: base.textTheme.copyWith(
        titleLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        bodyMedium: const TextStyle(fontSize: 14, height: 1.4, color: Colors.black54),
      ),
    );
  }
}
