import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_router.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';
import 'package:university_chatbot/core/utils/assets.dart';
import 'package:university_chatbot/core/utils/constants.dart';
import 'package:university_chatbot/features/on_boarding_screens/controllers/onboarding_controller.dart';
import 'package:university_chatbot/features/on_boarding_screens/presentation/view/widgets/on_boarding_screen_body.dart';
import 'package:university_chatbot/features/on_boarding_screens/presentation/view/widgets/smooth_indicator_widget.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller.indicator,
              onPageChanged: (value) {
                controller.page.value = value;
              },
              children: const [
                OnBoardingScreenBody(
                  imageLink: Assets.artificial,
                  content: kArtificialBody,
                ),
                OnBoardingScreenBody(
                  imageLink: Assets.bot,
                  content: kAiBody,
                ),
                OnBoardingScreenBody(
                  imageLink: Assets.search,
                  content: kSearchBody,
                ),
              ],
            ),
            Container(
              alignment: const Alignment(0.8, -1),
              child: GestureDetector(
                onTap: () {
                  controller.indicator.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'Skip',
                  style: AppStyles.style18SemiBold(context,
                      color: AppColors.primaryColor),
                ),
              ),
            ),
            SmoothIndicatorWidget(controller: controller),
            Obx(
              () => controller.page.value == 2
                  ? Positioned(
                      bottom: 30,
                      right: 20,
                      child: FloatingActionButton(
                        onPressed: () => Get.toNamed(AppRouter.chatbotUi),
                        backgroundColor: AppColors.primaryColor,
                        child: const Icon(Icons.chevron_right,
                            color: Colors.white),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
