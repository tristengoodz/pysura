import 'package:flutter/material.dart';

import '../common/app_color.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final VoidCallback? onPressed;
  final bool isBusy;

  const SecondaryButton({
    Key? key,
    required this.title,
    required this.textStyle,
    this.onPressed,
    required this.isBusy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isBusy ? null : onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        textStyle: MaterialStateProperty.all(textStyle),
      ),
      child: isBusy
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: AppColor.primary,
                strokeWidth: 2,
              ),
            )
          : Text(title),
    );
  }
}
