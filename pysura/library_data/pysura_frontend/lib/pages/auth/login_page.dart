import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'login_page_controller.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import '../../common/constants.dart';
import '../../widgets/phone_number_field.dart';
import '../../common/app_text_style.dart';
import '../../common/app_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController controller = Get.find();
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),

                /// Title and App Name
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    textStyle: AppTextStyle.displaySmall,
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome to ${Constants.kAppName}',
                  style: GoogleFonts.poppins(
                    textStyle: AppTextStyle.headlineSmall,
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 32),

                /// Phone number text field and Code request button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: PhoneNumberField(
                        onNumberChanged: (number) {
                          controller.phoneNumber = number ?? '';
                        },
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 90,
                          child: SecondaryButton(
                            title: 'Code',
                            textStyle: GoogleFonts.poppins(
                              textStyle: AppTextStyle.titleMedium,
                            ),
                            onPressed: () {
                              controller.requestSmsCode();
                            },
                            isBusy: controller.codeRequested,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                /// SMS Code input box and Login button
                Opacity(
                  opacity: controller.shouldShowSmsCodeBox ? 1 : 0,
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.smsCodeController,
                        decoration: AppTextStyle.generateTextFieldDecoration(
                            'SMS Code', ''),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: AppTextStyle.displaySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: PrimaryButton(
                          title: 'Login',
                          textStyle: GoogleFonts.poppins(
                            textStyle: AppTextStyle.headlineMedium,
                          ),
                          onPressed: () {
                            controller.signIn();
                          },
                          isBusy: controller.signInRequested,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                /// Privacy policy link
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    onTap: () {
                      controller.openPrivacyPolicy();
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          textStyle: AppTextStyle.bodySmall,
                          color: AppColor.secondary,
                        ),
                        children: const [
                          TextSpan(
                            text: 'By logging in, you agree to our\n',
                          ),
                          TextSpan(
                            text: 'Privacy policy and Terms of use',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
