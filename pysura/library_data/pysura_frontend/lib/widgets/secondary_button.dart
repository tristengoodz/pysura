import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/common/styles.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final int fontSize;
  final VoidCallback? onPressed;
  final bool isBusy;
  final bool expanded;

  const SecondaryButton({
    super.key,
    required this.title,
    this.fontSize = 20,
    this.onPressed,
    this.isBusy = false,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isBusy) return;
        onPressed?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        alignment: expanded ? Alignment.center : null,
        child: isBusy
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: kPrimaryColor,
                ),
              )
            : Text(
                title,
                style: GoogleFonts.poppins(
                  color: kPrimaryColor,
                  fontSize: fontSize.toDouble(),
                  fontWeight: FontWeight.normal,
                ),
              ),
      ),
    );
  }
}
