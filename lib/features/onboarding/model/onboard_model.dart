import 'package:ar_drawing_app/generated/l10n.dart';

class OnboardModel {
  final String title;
  final String label;
  final String imageAssets;
  OnboardModel({
    required this.title,
    required this.label,
    required this.imageAssets,
  });
}

final List<OnboardModel> tabs = [
  OnboardModel(
      title: S.current.intro_title_1,
      label: S.current.intro_subtitle_1,
      imageAssets: 'assets/image/onboarding1.png'),
  OnboardModel(
      title: S.current.intro_title_2,
      label: S.current.intro_subtitle_2,
      imageAssets: 'assets/image/onboarding2.png'),
  OnboardModel(
      title: S.current.intro_title_3,
      label: S.current.intro_subtitle_3,
      imageAssets: 'assets/image/onboarding3.png'),
];
