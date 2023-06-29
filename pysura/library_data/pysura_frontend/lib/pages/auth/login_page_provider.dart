import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/utils.dart';
import '/providers/auth_provider.dart';

class LoginPageProvider extends ChangeNotifier {
  bool _codeRequested = false;

  bool get codeRequested => _codeRequested;

  set codeRequested(bool value) {
    _codeRequested = value;
    notifyListeners();
  }

  bool _shouldShowSmsCodeBox = false;

  bool get shouldShowSmsCodeBox => _shouldShowSmsCodeBox;

  set shouldShowSmsCodeBox(bool value) {
    _shouldShowSmsCodeBox = value;
    notifyListeners();
  }

  bool _signInRequested = false;

  bool get signInRequested => _signInRequested;

  set signInRequested(bool value) {
    _signInRequested = value;
    notifyListeners();
  }

  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  String _verificationId = '';

  String get verificationId => _verificationId;

  set verificationId(String value) {
    _verificationId = value;
    notifyListeners();
  }

  late final TextEditingController smsCodeController;
  late final AuthProvider authProvider;

  LoginPageProvider(BuildContext context) {
    appLog('LoginPageProvider constructor()');
    smsCodeController = TextEditingController();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  void dispose() {
    appLog('LoginPageProvider dispose()');
    super.dispose();
    smsCodeController.dispose();
  }

  requestSmsCode(BuildContext context) {
    codeRequested = true;
    shouldShowSmsCodeBox = false;
    authProvider.verifyPhoneNumber(phoneNumber, onError: (errorMsg) {
      showSnackBar(context, errorMsg);
      codeRequested = false;
      shouldShowSmsCodeBox = false;
    }, onSmsReady: (verificationId) {
      this.verificationId = verificationId;
      codeRequested = false;
      shouldShowSmsCodeBox = true;
    });
  }

  signIn(BuildContext context) {
    final smsCode = smsCodeController.text;
    if (smsCode.isEmpty) return;
    signInRequested = true;
    authProvider.signInWithSmsCode(verificationId, smsCode).then(
      (error) {
        if (error != null) {
          showSnackBar(context, error);
          codeRequested = false;
          signInRequested = false;
        }
      },
    );
  }

  openPrivacyPolicy(BuildContext context) {
    showSnackBar(context, 'Link your privacy policy page here');
  }
}
