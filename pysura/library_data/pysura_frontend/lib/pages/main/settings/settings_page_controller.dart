import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/utils.dart';
import '../../../common/popups.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/data_controller.dart';
import '../../../controllers/graphql_controller.dart';
import '../../../controllers/theme_controller.dart';

class SettingsPageController extends GetxController {
  final authController = Get.find<AuthController>();
  final graphqlController = Get.find<GraphQLController>();
  final dataController = Get.find<DataController>();
  final themeController = Get.find<ThemeController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  selectThemeColor() async {
    appLog('Selecting theme color');
    await showColorPicker(
      themeController.seedColor,
      onPicked: (newColor) {
        if (newColor != null) {
          themeController.seedColor = newColor;
        }
      },
    );
  }

  switchLightDarkMode() {
    themeController.isDarkMode = !themeController.isDarkMode;
  }

  pickFile() async {
    final fileData = await pickFileAsString();
    if (fileData == null) {
      return;
    }
    final fileLength = fileData.length;
    if (fileLength > 50 * 1024 * 1024) {
      showSimpleSnackBar('Max file size is 50MB.');
      return;
    }
    appLog('Picked file size ${fileData.length} bytes');
    showSimpleSnackBar(
        'File picked. Converted file size: ${fileData.length} bytes');
  }

  getToken() async {
    final token = await graphqlController.getToken();
    await Clipboard.setData(ClipboardData(text: token));
    appLog('Copied token to clipboard: $token');
    showSimpleSnackBar('Copied token to clipboard');
  }

  deleteAccount() {
    showSimpleSnackBar('Coming soon ...');
  }

  signOut() {
    showDialog(
      context: Get.context!,
      builder: (_) => CommonPopup(
        title: 'Sign out',
        message: 'Are you sure you want to sign out?',
        confirmText: 'Yes',
        onConfirm: () async {
          await authController.signOut();
          // dataController.user = null;
          graphqlController.client = null;
        },
        cancelText: 'No',
      ),
    );
  }
}
