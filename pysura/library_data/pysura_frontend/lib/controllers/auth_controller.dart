import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../common/utils.dart';
import '../common/app_route.dart';

class AuthController extends GetxController {
  final _user = Rx<User?>(null);
  User? get user => _user.value;
  set user(User? value) => _user.value = value;

  var signedIn = false.obs;

  StreamSubscription? _authStateChangesSubscription;

  @override
  onInit() {
    super.onInit();
    appLog('AuthController onInit()');
  }

  initAuth() {
    user = FirebaseAuth.instance.currentUser;

    _authStateChangesSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      appLog('FirebaseAuth.authStateChanges()');
      this.user = user;
      if (user == null) {
        Get.offAllNamed(AppRoute.kLoginRoute);
      } else {
        Get.offAllNamed(AppRoute.kMainRoute);
      }
    });
  }

  @override
  void onClose() {
    appLog('AuthController onClose()');
    _authStateChangesSubscription?.cancel();
    super.onClose();
  }

  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String) onError,
    required Function(String) onSmsReady,
  }) async {
    final auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // list out all errors
        if (e.code == 'invalid-phone-number') {
          onError('Invalid phone number');
        } else {
          onError('Unknown error');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        onSmsReady(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<String?> signInWithSmsCode(
      String verificationId, String smsCode) async {
    final auth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      await auth.signInWithCredential(credential);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
