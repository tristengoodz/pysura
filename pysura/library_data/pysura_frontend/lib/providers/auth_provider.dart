import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/common/app_route.dart';
import '/common/utils.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  StreamSubscription? _authStateChangesSubscription;
  final BuildContext context;
  final GoRouter goRouter;

  AuthProvider({
    required this.context,
    required this.goRouter,
  }) {
    appLog('AuthProvider constructor');
    user = FirebaseAuth.instance.currentUser;
    initAuth();
  }

  initAuth() {
    _authStateChangesSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) async {
      appLog('FirebaseAuth.authStateChanges()');
      this.user = user;
      if (goRouter.location == kSplashRoute) {
        await Future.delayed(const Duration(seconds: 2));
      }
      if (user == null) {
        // go to login route
        goRouter.go(kLoginRoute);
      } else {
        goRouter.go(kHomeRoute);
      }
    });
  }

  @override
  void dispose() {
    appLog('AuthProvider dispose()');
    super.dispose();
    _authStateChangesSubscription?.cancel();
  }

  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String) onError,
    required Function(String) onSmsReady,
  }) async {
    final auth = FirebaseAuth.instance;
    if (kIsWeb) {
      final result = await auth.signInWithPhoneNumber(phoneNumber);
      onSmsReady(result.verificationId);
    } else {
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
