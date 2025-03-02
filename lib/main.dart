import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_router.dart';
import 'package:university_chatbot/core/utils/constants.dart';
import 'package:university_chatbot/features/on_boarding_screens/controllers/onboarding_controller.dart';

void main() {
  Get.put(OnboardingController());
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kfontFamily,
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: AppColors.surfaceColor,
      ),
      getPages: AppRouter.getViews(),
    );
  }
}
