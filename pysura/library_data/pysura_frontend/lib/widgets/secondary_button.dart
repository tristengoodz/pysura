import 'package:flutter/material.dart';

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
    this.isBusy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: isBusy ? null : onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        textStyle: MaterialStateProperty.all(textStyle),
      ),
      child: isBusy
          ? Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: colorScheme.primary,
                  strokeWidth: 2,
                ),
              ),
            )
          : Text(title),
    );
  }
}
