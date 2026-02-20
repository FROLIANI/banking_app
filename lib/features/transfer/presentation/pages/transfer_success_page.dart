import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/core/widgets/primary_button.dart';
import 'package:banking/core/widgets/secondary_button.dart';

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key});

  void _goToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.signIn,
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppTheme.primary,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
            child: Column(
              children: [
                const Spacer(),

                /// Animated success icon
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 600),
                  tween: Tween(begin: 0.7, end: 1),
                  curve: Curves.easeOutBack,
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Transferred\nSuccessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 14),

                const Text(
                  "Dear user your amount has been transferred\n"
                      "to your requested receipt. Thank you for\n"
                      "using our service.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.white70,
                  ),
                ),

                const Spacer(),

                /// View Details → Login
                SecondaryButton(
                  label: "View Details",
                  onPressed: () => _goToLogin(context),
                ),

                const SizedBox(height: 14),

                /// Continue → Login
                PrimaryButton(
                  label: "Continue",
                  onPressed: () => _goToLogin(context),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}