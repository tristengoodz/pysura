import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final _user = Rx<User?>(null);

  User? get user => _user.value;

  set user(User? value) => _user.value = value;

  Future<void> verifyPhoneNumber(String phoneNumber, {
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

  Future<void> signInWithSmsCode(String verificationId, String smsCode) async {
    final auth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}