import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../common/app_route.dart';
import '../../controllers/auth_controller.dart';
import 'main_page_controller.dart';

class MainPageMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    final mainPageController = Get.find<MainPageController>();
    // redirect to login page if not signed in
    if (authController.user == null) {
      return const RouteSettings(name: AppRoute.kLoginRoute);
    } else {
      // handle deep link to each tabs of main page
      final tab = Get.parameters['tab'];
      if (tab == null || tab == AppRoute.kHomeTab) {
        mainPageController.page = 0;
      } else if (tab == AppRoute.kActionTab) {
        mainPageController.page = 1;
      } else {
        return const RouteSettings(name: AppRoute.kErrorRoute);
      }
      return null;
    }
  }
}
