import 'package:get/get.dart';
import 'package:university_chatbot/features/on_boarding_screens/presentation/view/onboarding_view.dart';
import 'package:university_chatbot/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static String splashView = "/";
  static String onBoarding = "/onBoarding";
  static String chatbotUi = "/chatBotUi";

  static List<GetPage<dynamic>>? getViews() {
    return [
      GetPage(
        name: splashView,
        page: () => const SplashView(),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: onBoarding,
        page: () => const OnboardingView(),
        transition: Transition.circularReveal,
      ),
    ];
  }
}
