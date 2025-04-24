import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_router.dart';
import 'package:university_chatbot/core/utils/constants.dart';
import 'package:university_chatbot/features/on_boarding_screens/controllers/onboarding_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize dependencies
  Get.put(Dio());
  Get.put(OnboardingController());
  Get.put(NavigationController());

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'University Chatbot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kfontFamily,
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: AppColors.surfaceColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppRouter.getViews(),
      defaultTransition: Transition.fade,
      initialRoute: AppRouter.splashView,
    );
  }
}

// Navigation controller for app-wide navigation control
class NavigationController extends GetxController {
  void goToChat() {
    Get.offAllNamed(AppRouter.chatbotUi);
  }

  void goToOnboarding() {
    Get.offAllNamed(AppRouter.onBoarding);
  }

  void goToSplash() {
    Get.offAllNamed(AppRouter.splashView);
  }
}
