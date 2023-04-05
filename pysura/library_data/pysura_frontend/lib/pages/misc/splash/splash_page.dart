import 'package:flutter/material.dart';

import '../../../common/app_text_style.dart';
import '../../../common/constants.dart';
import '../../../common/app_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${Constants.kAppName} is loading...',
              style: AppTextStyle.bodyMedium,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: LinearProgressIndicator(
                color: AppColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
