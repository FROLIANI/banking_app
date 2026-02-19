
class OnboardingItem {
  final String title;
  final String description;
  final String imageAsset;
  final String primaryButtonLabel;
  final bool showSkip;
  final bool showSecondaryLink;
  final String? secondaryLinkLabel;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.primaryButtonLabel,
    this.showSkip = true,
    this.showSecondaryLink = false,
    this.secondaryLinkLabel,
  });
}
