import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/constants.dart';
import '/common/utils.dart';
import '/pages/auth/login_page_provider.dart';
import '/widgets/primary_button.dart';
import '/widgets/secondary_button.dart';
import '/widgets/phone_number_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = Provider.of<LoginPageProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: MediaQuery.sizeOf(context).width > Constants.kMinWidth
                ? const BoxConstraints(maxWidth: 500)
                : const BoxConstraints(),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),

                /// Title and App Name
                Text(
                  'Login',
                  style: textTheme.displaySmall!.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Welcome to ${Constants.kAppName}',
                  style: textTheme.headlineSmall!.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),

                /// Phone number text field and Code request button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: PhoneNumberField(
                        onNumberChanged: (number) {
                          provider.phoneNumber = number ?? '';
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
                            textStyle: textTheme.titleMedium!,
                            onPressed: () {
                              provider.requestSmsCode(context);
                            },
                            isBusy: provider.codeRequested,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                /// SMS Code input box and Login button
                Opacity(
                  opacity: provider.shouldShowSmsCodeBox ? 1 : 0,
                  child: Column(
                    children: [
                      TextField(
                        controller: provider.smsCodeController,
                        decoration: generateTextFieldDecoration(
                            context, 'SMS Code', ''),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: textTheme.displaySmall!,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: PrimaryButton(
                          title: 'Login',
                          textStyle: textTheme.headlineMedium!,
                          onPressed: () {
                            provider.signIn(context);
                          },
                          isBusy: provider.signInRequested,
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
                      provider.openPrivacyPolicy(context);
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.secondary,
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
