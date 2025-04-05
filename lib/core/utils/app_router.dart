import 'package:get/get.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/chatbot_ui.dart';
import 'package:university_chatbot/features/chat_bot_ui/view_model/bindings/chatbot_bindings.dart';
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
      GetPage(
          name: chatbotUi,
          page: () => ChatbotUi(),
          transition: Transition.circularReveal,
          binding: ChatbotBinding()),
    ];
  }
}
