import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import 'app_color.dart';
import 'app_text_style.dart';

class CommonPopup extends StatelessWidget {
  final String? title;
  final String message;
  final String? cancelText;
  final String confirmText;
  final Function? onCancel;
  final Function? onConfirm;

  const CommonPopup({
    super.key,
    this.title,
    required this.message,
    required this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null
          ? null
          : Text(title ?? '', style: AppTextStyle.titleMedium),
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 16),
      content: Text(message, style: AppTextStyle.bodyMedium),
      actions: [
        PrimaryButton(
          title: confirmText,
          textStyle: GoogleFonts.poppins(
            textStyle: AppTextStyle.titleMedium,
            color: AppColor.primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
          isBusy: false,
        ),
        if (cancelText != null)
          SecondaryButton(
            title: cancelText!,
            textStyle: GoogleFonts.poppins(
              textStyle: AppTextStyle.titleMedium,
              color: AppColor.primary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onCancel?.call();
            },
            isBusy: false,
          ),
      ],
    );
  }
}

GetSnackBar buildSimpleSnackBar(String message) {
  return GetSnackBar(
    onTap: (_) {
      Get.back();
    },
    snackStyle: SnackStyle.GROUNDED,
    animationDuration: const Duration(milliseconds: 300),
    duration: const Duration(seconds: 5),
    backgroundColor: AppColor.primary,
    messageText: Text(
      message,
      style: GoogleFonts.roboto(
        textStyle: AppTextStyle.bodyLarge,
        color: AppColor.onPrimary,
      ),
    ),
    mainButton: TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        'OK',
        style: GoogleFonts.roboto(
          textStyle: AppTextStyle.labelLarge,
          color: AppColor.onPrimary,
        ),
      ),
    ),
  );
}

showSimpleSnackBar(String message) {
  Get.showSnackbar(
    buildSimpleSnackBar(message),
  );
}

showColorPicker(
  Color? initialColor, {
  required Function(Color?) onPicked,
}) async {
  await Get.bottomSheet(
    Container(
      constraints: const BoxConstraints(
        maxHeight: 600,
      ),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Pick a color for your app\'s theme',
                  style: GoogleFonts.poppins(
                    textStyle: AppTextStyle.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                ),
              ),
            ],
          ),
          ColorPicker(
            pickerColor: initialColor ?? AppColor.primary,
            onColorChanged: onPicked,
            pickerAreaHeightPercent: 0.8,
          ),
        ],
      ),
    ),
  );
}
