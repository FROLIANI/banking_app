import 'package:flutter/material.dart';
import 'package:banking/features/onboarding/presentation/widgets/onboarding_slide.dart';

class EasyToUseSlide extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onSkip;

  const EasyToUseSlide({
    super.key,
    required this.onNext,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingSlide(
      imageAsset: "assets/images/onboarding/wand.png",
      title: "Easy To Use",
      description:
      "Manage your bank account, financial transaction. It's all easy like never before.",
      primaryButtonLabel: "Next",
      onPrimaryPressed: onNext,
      showSkip: true,
      onSkip: onSkip,
    );
  }
}