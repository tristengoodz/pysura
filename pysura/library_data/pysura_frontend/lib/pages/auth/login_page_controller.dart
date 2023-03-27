import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '/common/popups.dart';
import '/common/constants.dart';

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

  @override
  onInit() {
    super.onInit();
    print('LoginPageController onInit()');
  }

  @override
  dispose() {
    print('LoginPageController dispose()');
    smsCodeController.dispose();
    super.dispose();
  }

  requestSmsCode() {
    codeRequested = true;
    authController.verifyPhoneNumber(phoneNumber, onError: (errorMsg) {
      showSimpleSnackBar(errorMsg);
      codeRequested = false;
      shouldShowSmsCodeBox = false;
      codeRequested = false;
    }, onSmsReady: (verificationId) {
      this.verificationId = verificationId;
      shouldShowSmsCodeBox = true;
      codeRequested = false;
    });
  }

  signIn() {
    final smsCode = smsCodeController.text;
    if (smsCode.isEmpty) return;
    authController.signInWithSmsCode(verificationId, smsCode);
    signInRequested = true;
  }
}