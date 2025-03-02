import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/features/on_boarding_screens/controllers/onboarding_controller.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({
    super.key,
    required this.controller,
  });

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller.indicator,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.primaryColor,
            dotColor: AppColors.gray2Color,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 12.0,
            radius: 5.0,
            paintStyle: PaintingStyle.fill,
            expansionFactor: 3.0,
            offset: 2.0,
          ),
        ),
      ),
    );
  }
}
