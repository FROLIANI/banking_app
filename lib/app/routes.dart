import 'package:flutter/material.dart';
import 'package:banking/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:banking/features/auth/presentation/pages/sign_in_page.dart';
import 'package:banking/features/auth/presentation/pages/sign_up_page.dart';
import 'package:banking/features/auth/presentation/pages/phone_registration_page.dart';
import 'package:banking/features/auth/presentation/pages/verify_account_page.dart';
import 'package:banking/features/transfer/presentation/pages/transfer_success_page.dart';

class AppRoutes {
  static const onboarding = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const phoneRegistration = '/phone-registration';
  static const verifyAccount = '/verify-account';
  static const transferSuccess = '/transfer-success';

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
      case transferSuccess:
        return MaterialPageRoute(builder: (_) => const TransferSuccessPage());
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    }
  }
}
