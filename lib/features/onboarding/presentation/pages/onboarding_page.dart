import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/page_dots.dart';

import 'package:banking/features/onboarding/presentation/slides/encrypted_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/meela_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/easy_to_use_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/watch_tutorial_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/fast_secure_slide.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _controller;
  int _index = 0;

  int get _totalSlides => 5;

  bool get _isLast => _index == _totalSlides - 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _goNextOrFinish() async {
    HapticFeedback.selectionClick();

    if (_isLast) {
      Navigator.pushReplacementNamed(context, AppRoutes.signUp);
      return;
    }

    await _controller.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  Widget _buildSlide(int i) {
    switch (i) {
      case 0:
        return EncryptedSlide(onNext: _goNextOrFinish, onSkip: _goNextOrFinish);
      case 1:
        return MeelaSlide(onNext: _goNextOrFinish);
      case 2:
        return EasyToUseSlide(onNext: _goNextOrFinish, onSkip: _goNextOrFinish);
      case 3:
        return WatchTutorialSlide(
          onNext: _goNextOrFinish,
          onSignIn: () =>
              Navigator.pushReplacementNamed(context, AppRoutes.signIn),
        );
      case 4:
        return FastSecureSlide(
            onNext: _goNextOrFinish, onSkip: _goNextOrFinish);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _totalSlides,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (_, i) => _buildSlide(i),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: PageDots(
              count: _totalSlides,
              index: _index,
            ),
          ),
        ],
      ),
    );
  }
}