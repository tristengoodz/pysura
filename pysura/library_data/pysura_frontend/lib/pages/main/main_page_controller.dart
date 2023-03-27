import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/popups.dart';
import '/controllers/auth_controller.dart';

class MainPageController extends GetxController {
  final _title = 'Main Page'.obs;
  final authController = Get.find<AuthController>();

  String get title => _title.value;

  set title(String value) => _title.value = value;

  void signOut() {
    showDialog(
      context: Get.context!,
      builder: (_) => CommonPopup(
        title: 'Sign out',
        message: 'Are you sure you want to sign out?',
        confirmText: 'Yes',
        onConfirm: () async {
          await authController.signOut();
        },
        cancelText: 'No',
      ),
    );
  }
}
