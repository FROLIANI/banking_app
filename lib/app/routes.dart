import 'package:flutter/material.dart';
import 'package:banking/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:banking/features/auth/presentation/pages/sign_in_page.dart';
import 'package:banking/features/auth/presentation/pages/sign_up_page.dart';
import 'package:banking/features/auth/presentation/pages/phone_registration_page.dart';
import 'package:banking/features/auth/presentation/pages/verify_account_page.dart';
import 'package:banking/features/transfer/presentation/pages/transfer_success_page.dart';
import 'package:banking/features/dashboard/presentation/pages/dashboard_page.dart';

import 'package:banking/features/transfer/presentation/pages/transfer_page.dart';
import 'package:banking/features/withdraw/presentation/pages/withdraw_page.dart';
import 'package:banking/features/deposit/presentation/pages/deposit_page.dart';
import 'package:banking/features/cards/presentation/pages/cards_page.dart';
import 'package:banking/features/analytics/presentation/pages/analytics_page.dart';
import 'package:banking/features/budget/presentation/pages/budget_page.dart';


class AppRoutes {
  static const onboarding = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const phoneRegistration = '/phone-registration';
  static const verifyAccount = '/verify-account';
  static const transferSuccess = '/transfer-success';
  static const dashboard = '/dashboard';

  static const transfer = '/transfer';
  static const withdraw = '/withdraw';
  static const deposit = '/deposit';
  static const cards = '/cards';
  static const analytics = '/analytics';
  static const budget = '/budget';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case phoneRegistration:
        return MaterialPageRoute(builder: (_) => const PhoneRegistrationPage());
      case verifyAccount:
        return MaterialPageRoute(builder: (_) => const VerifyAccountPage());

      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case transferSuccess:
        return MaterialPageRoute(builder: (_) => const TransferSuccessPage());
      case transfer:
        return MaterialPageRoute(builder: (_) => const TransferPage());

      case withdraw:
        return MaterialPageRoute(builder: (_) => const WithdrawPage());

      case deposit:
        return MaterialPageRoute(builder: (_) => const DepositPage());

      case cards:
        return MaterialPageRoute(builder: (_) => const CardsPage());

      case analytics:
        return MaterialPageRoute(builder: (_) => const AnalyticsPage());

      case budget:
        return MaterialPageRoute(builder: (_) => const BudgetPage());
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    }
  }
}
