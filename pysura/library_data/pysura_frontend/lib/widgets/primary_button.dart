import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final VoidCallback? onPressed;
  final bool isBusy;
  final Color? overrideColor;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.textStyle,
    this.onPressed,
    this.isBusy = false,
    this.overrideColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: isBusy ? null : onPressed,
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(textStyle),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        backgroundColor:
            MaterialStateProperty.all(overrideColor ?? colorScheme.primary),
      ),
      child: isBusy
          ? Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: colorScheme.onPrimary,
                  strokeWidth: 2,
                ),
              ),
            )
          : Text(title),
    );
  }
}
