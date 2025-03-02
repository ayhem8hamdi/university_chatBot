import 'package:get/get.dart';


abstract class AppRouter {
  static String splashView = "/";
  static String onBoarding = "/onBoarding";
  static String chatbotUi = "/chatBotUi";

  static List<GetPage<dynamic>>? getViews() {
    return [

    ];
  }
}
