import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/styles.dart';
import '/widgets/primary_button.dart';
import '/widgets/secondary_button.dart';

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
      title: title == null ? null : Text(title ?? ''),
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 16),
      content: Text(message),
      actions: [
        PrimaryButton(
          title: confirmText,
          fontSize: 16,
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
        ),
        if (cancelText != null)
          SecondaryButton(
            title: cancelText!,
            fontSize: 16,
            onPressed: () {
              Navigator.of(context).pop();
              onCancel?.call();
            },
          ),
      ],
    );
  }
}

class InputPopup extends StatelessWidget {
  final String title;
  final String? label;
  final String? initialValue;
  final String confirmText;
  final Function(String) onConfirm;

  const InputPopup({
    Key? key,
    required this.title,
    this.label,
    this.initialValue,
    required this.confirmText,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.text = initialValue ?? '';

    return AlertDialog(
      title: Text(title),
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 16),
      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: generateTextFieldDecoration(label ?? '', ''),
        onSubmitted: (value) {
          Navigator.of(context).pop();
          onConfirm(value);
        },
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 10,
      ),
      actions: [
        PrimaryButton(
          title: confirmText,
          fontSize: 16,
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm(controller.text);
          },
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
    duration: const Duration(seconds: 3),
    messageText: Text(
      message,
      style: const TextStyle(
        color: kWhite,
      ),
    ),
    backgroundColor: kPrimaryColor,
  );
}

showSimpleSnackBar(String message) {
  Get.showSnackbar(
    buildSimpleSnackBar(message),
  );
}