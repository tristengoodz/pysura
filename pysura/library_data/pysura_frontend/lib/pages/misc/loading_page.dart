import 'package:flutter/material.dart';

import '../../common/app_color.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.primary,
        ),
      ),
    );
  }
}
