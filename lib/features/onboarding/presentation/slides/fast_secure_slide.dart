import 'package:flutter/material.dart';
import 'package:banking/features/onboarding/presentation/widgets/onboarding_slide.dart';

class FastSecureSlide extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onSkip;

  const FastSecureSlide({
    super.key,
    required this.onNext,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingSlide(
      imageAsset: "assets/images/onboarding/secure.png",
      title: "Fast & Secure",
      description:
      "Don't worry about 3rd Party Hacks. It is fast and secure.",
      primaryButtonLabel: "Next",
      onPrimaryPressed: onNext,
      showSkip: true,
      onSkip: onSkip,
    );
  }
}