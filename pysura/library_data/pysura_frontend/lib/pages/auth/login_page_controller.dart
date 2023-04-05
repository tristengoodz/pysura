import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../controllers/auth_controller.dart';
import '../../common/popups.dart';

class LoginPageController extends GetxController {
  final _codeRequested = false.obs;
  bool get codeRequested => _codeRequested.value;
  set codeRequested(bool value) => _codeRequested.value = value;

  final _shouldShowSmsCodeBox = false.obs;
  bool get shouldShowSmsCodeBox => _shouldShowSmsCodeBox.value;
  set shouldShowSmsCodeBox(bool value) => _shouldShowSmsCodeBox.value = value;

  final _signInRequested = false.obs;
  bool get signInRequested => _signInRequested.value;
  set signInRequested(bool value) => _signInRequested.value = value;

  final _phoneNumber = ''.obs;
  String get phoneNumber => _phoneNumber.value;
  set phoneNumber(String value) => _phoneNumber.value = value;

  final _verificationId = ''.obs;
  String get verificationId => _verificationId.value;
  set verificationId(String value) => _verificationId.value = value;

  final _smsCodeController = TextEditingController().obs;
  TextEditingController get smsCodeController => _smsCodeController.value;
  set smsCodeController(TextEditingController value) =>
      _smsCodeController.value = value;

  final authController = Get.find<AuthController>();

  @override
  onInit() {
    super.onInit();
    appLog('LoginPageController onInit()');
  }

  @override
  dispose() {
    appLog('LoginPageController dispose()');
    smsCodeController.dispose();
    super.dispose();
  }

  requestSmsCode() {
    codeRequested = true;
    shouldShowSmsCodeBox = false;
    authController.verifyPhoneNumber(phoneNumber, onError: (errorMsg) {
      showSimpleSnackBar(errorMsg);
      codeRequested = false;
      shouldShowSmsCodeBox = false;
    }, onSmsReady: (verificationId) {
      this.verificationId = verificationId;
      codeRequested = false;
      shouldShowSmsCodeBox = true;
    });
  }

  signIn() async {
    final smsCode = smsCodeController.text;
    if (smsCode.isEmpty) return;
    signInRequested = true;
    final error =
        await authController.signInWithSmsCode(verificationId, smsCode);
    if (error != null) {
      showSimpleSnackBar(error);
      codeRequested = false;
      signInRequested = false;
    }
  }

  openPrivacyPolicy() {
    // TODO: - link privacy policy page
    showSimpleSnackBar('Link your privacy policy page here');
  }
}
