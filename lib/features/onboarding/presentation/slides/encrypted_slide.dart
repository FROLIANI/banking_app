import 'package:flutter/material.dart';
import 'package:banking/features/onboarding/presentation/widgets/onboarding_slide.dart';

class EncryptedSlide extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const EncryptedSlide({
    super.key,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingSlide(
      imageAsset: "assets/images/onboarding/lock.png",
      title: "Encrypted",
      description:
      "Our new encrypted process makes it more secure between you and your bank",
      primaryButtonLabel: "Next",
      onPrimaryPressed: onNext,

      // ✅ UI shows Skip under the button
      showSkip: true,
      onSkip: onSkip,
    );
  }
}
