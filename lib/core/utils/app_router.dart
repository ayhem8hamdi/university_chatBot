import 'package:get/get.dart';
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
    ];
  }
}
