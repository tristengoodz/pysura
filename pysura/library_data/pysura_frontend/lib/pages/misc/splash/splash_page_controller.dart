import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../common/utils.dart';

class SplashPageController extends GetxController {
  @override
  onInit() {
    super.onInit();
    appLog('SplashPageController onInit()');
    _initialize();
  }

  @override
  dispose() {
    appLog('SplashPageController dispose()');
    super.dispose();
  }

  _initialize() async {
    /// Wait for 2 seconds and start Firebase Auth Check
    await Future.delayed(const Duration(seconds: 2));
    // Get.offAllNamed(AppRoute.kMainRoute);
    final authController = Get.find<AuthController>();
    authController.initAuth();
  }
}
