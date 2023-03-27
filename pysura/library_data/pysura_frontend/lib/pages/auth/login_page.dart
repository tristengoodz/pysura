import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '/common/styles.dart';
import '/pages/auth/login_page_controller.dart';
import '/widgets/primary_button.dart';
import '/widgets/secondary_button.dart';
import '/common/constants.dart';
import '/widgets/phone_number_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController controller = Get.put(LoginPageController());
    return Scaffold(
      body: Obx(() =>
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Text(
                  'Login',
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome to $kAppName',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: kDarkGrey,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: PhoneNumberField(
                        onNumberChanged: (number) {
                          controller.phoneNumber = number ?? '';
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      flex: 1,
                      child: SecondaryButton(
                        title: 'Code',
                        fontSize: 14,
                        onPressed: () {
                          controller.requestSmsCode();
                        },
                        isBusy: controller.codeRequested,
                        expanded: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Opacity(
                  opacity: controller.shouldShowSmsCodeBox ? 1 : 0,
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.smsCodeController,
                        decoration: generateTextFieldDecoration(
                            'Code', 'Enter your SMS code'),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          color: kBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: 60,
                        child: PrimaryButton(
                          title: 'Login',
                          fontSize: 18,
                          onPressed: () {
                            controller.signIn();
                          },
                          isBusy: controller.signInRequested,
                          expanded: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: InkWell(
                    onTap: () {
                      print('Open privacy policy webpage');
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            color: kPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          children: const [
                            TextSpan(text: 'By logging in, you agree to our\n'),
                            TextSpan(
                                text: 'Privacy policy and Terms of use',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}