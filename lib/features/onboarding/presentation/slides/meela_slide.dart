import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class MeelaSlide extends StatelessWidget {
  const MeelaSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/images/onboarding/shield.png",
                height: 180,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "Meela",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            "Bank, Finance and Wallet UI Kit",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
