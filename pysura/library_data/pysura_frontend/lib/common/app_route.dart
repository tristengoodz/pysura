import 'package:get/get.dart';

import '../pages/misc/splash/splash_page.dart';
import '../pages/misc/splash/splash_page_controller.dart';
import '../pages/misc/error_page.dart';
import '../pages/misc/loading_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/login_page_controller.dart';
import '../pages/main/main_page.dart';
import '../pages/main/main_page_controller.dart';
import '../pages/main/main_page_middleware.dart';
import '../pages/main/home/home_page_controller.dart';
import '../pages/main/action/action_page_controller.dart';
import '../pages/main/settings/settings_page.dart';
import '../pages/main/settings/settings_page_controller.dart';

class AppRoute {
  static const String kSplashRoute = '/splash';
  static const String kLoginRoute = '/login';
  static const String kMainRoute = '/main/';
  static const String kMainTabRoute = '/main/:tab';
  static const String kSettingsRoute = '/settings';
  static const String kErrorRoute = '/error';
  static const String kLoadingRoute = '/loading';

  static const String kHomeTab = 'home';
  static const String kActionTab = 'action';

  static List<GetPage> setupPageRoutes() {
    return [
      GetPage(
        name: kSplashRoute,
        page: () => const SplashPage(),
        binding: BindingsBuilder(() {
          Get.put(SplashPageController());
        }),
      ),
      GetPage(
        name: kLoginRoute,
        page: () => const LoginPage(),
        binding: BindingsBuilder(() {
          Get.put(LoginPageController());
        }),
      ),
      GetPage(
        name: kMainRoute,
        page: () => const MainPage(),
        binding: BindingsBuilder(() {
          Get.put(HomePageController());
          Get.put(ActionPageController());
          Get.put(MainPageController());
        }),
      ),
      GetPage(
        name: kMainTabRoute,
        page: () => const MainPage(),
        binding: BindingsBuilder(() {
          Get.put(HomePageController());
          Get.put(ActionPageController());
          Get.put(MainPageController());
        }),
        middlewares: [
          MainPageMiddleware(),
        ],
      ),
      GetPage(
        name: kSettingsRoute,
        page: () => const SettingsPage(),
        binding: BindingsBuilder(() {
          Get.put(SettingsPageController());
        }),
      ),
      GetPage(
        name: kErrorRoute,
        page: () => const ErrorPage(),
      ),
      GetPage(
        name: kLoadingRoute,
        page: () => const LoadingPage(),
      ),
    ];
  }
}
