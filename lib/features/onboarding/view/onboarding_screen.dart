import 'package:ar_drawing_app/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:ar_drawing_app/features/onboarding/widget/page_content_widget.dart';
import 'package:ar_drawing_app/generated/l10n.dart';
import 'package:ar_drawing_app/features/permission/view/permission_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/onboard_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = '/OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _IntroScreeState();
}

class _IntroScreeState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 460,
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    context
                        .read<OnboardingBloc>()
                        .add(ChangeOnboardingEvent(currentIndex: value));
                  },
                  children: [
                    PageContentWidget(
                        imageAssets: tabs[0].imageAssets,
                        title: tabs[0].title,
                        label: tabs[0].label),
                    PageContentWidget(
                        imageAssets: tabs[1].imageAssets,
                        title: tabs[1].title,
                        label: tabs[1].label),
                    PageContentWidget(
                        imageAssets: tabs[2].imageAssets,
                        title: tabs[2].title,
                        label: tabs[2].label),
                  ],
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DotsIndicator(
                      dotsCount: 3,
                      position: state.currentIndex,
                      decorator: DotsDecorator(
                        color: const Color.fromRGBO(197, 197, 197, 1),
                        activeColor: const Color.fromRGBO(55, 133, 250, 1),
                        size: const Size.square(8.0),
                        activeSize: const Size(20.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        spacing: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (state.currentIndex == tabs.length - 1) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PermissionScreen()));
                        } else {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        }
                      },
                      child: Text(
                        state.currentIndex == tabs.length - 1
                            ? S.current.start
                            : S.current.next,
                        style: const TextStyle(
                          fontFamily: 'SVNGilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(13, 12, 12, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
