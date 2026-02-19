import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/app/theme/app_theme.dart';

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking',
      theme: AppTheme.light(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.onboarding,
    );
  }
}
