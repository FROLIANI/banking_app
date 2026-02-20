import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/features/onboarding/presentation/widgets/onboarding_slide.dart';

class MeelaSlide extends StatelessWidget {
  final VoidCallback onNext;

  const MeelaSlide({
    super.key,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingSlide(
      imageAsset: "assets/images/onboarding/shield.png",
      title: "Banking",
      description: "Bank, Finance and Wallet UI Kit",
      primaryButtonLabel: "Next",
      onPrimaryPressed: onNext,
      showSkip: true,
      backgroundColor: AppTheme.primary,
      titleColor: Colors.white,
      descriptionColor: Colors.white70,
      imageTint: null,
    );
  }
}