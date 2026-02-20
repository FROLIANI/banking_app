import 'package:flutter/material.dart';
import 'package:banking/features/onboarding/presentation/widgets/onboarding_slide.dart';

class WatchTutorialSlide extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSignIn;

  const WatchTutorialSlide({
    super.key,
    required this.onNext,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingSlide(
      imageAsset: "assets/images/onboarding/video.png",
      title: "Watch Tutorial",
      description:
      "If you are new on this and need help, watch this short tutorial clip to get started.",
      primaryButtonLabel: "Next",
      onPrimaryPressed: onNext,
      showSkip: true,
      onSkip: onSignIn,
    );
  }
}