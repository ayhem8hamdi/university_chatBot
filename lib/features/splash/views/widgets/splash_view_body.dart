import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/core/utils/app_router.dart';
import 'package:university_chatbot/features/splash/views/widgets/image_fade_transition.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    navigationToIntroScreen();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LogoFadeTransition(fadeAnimation: fadeAnimation),
      ],
    );
  }

  void initFadeAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward();
  }

  void navigationToIntroScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRouter.onBoarding);
    });
  }
}
