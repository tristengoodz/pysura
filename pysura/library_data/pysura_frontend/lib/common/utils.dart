import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '/providers/theme_provider.dart';

appLog(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

InputDecoration generateTextFieldDecoration(
  BuildContext context,
  String label,
  String hint, {
  Widget? prefixWidget,
  Widget? suffixWidget,
}) =>
    InputDecoration(
      labelText: label,
      hintText: hint,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      prefixIcon: prefixWidget,
      suffixIcon: suffixWidget,
    );

showSnackBar(BuildContext context, String message) {
  final colorScheme = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: colorScheme.primaryContainer,
      content: Text(
        message,
        style: TextStyle(
          color: colorScheme.onPrimaryContainer,
        ),
      ),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: colorScheme.onPrimaryContainer,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

showColorPicker(
  BuildContext context,
  Color? initialColor, {
  required Function(Color?) onPicked,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black45,
    builder: (context) {
      return BottomSheet(
        constraints: const BoxConstraints(
          maxHeight: 600,
          maxWidth: 1000,
        ),
        onClosing: () {},
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pick a color for your app\'s theme',
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, _) => ColorPicker(
                    portraitOnly: true,
                    pickerColor: themeProvider.seedColor,
                    onColorChanged: onPicked,
                    pickerAreaHeightPercent: 0.4,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String confirmText,
  required Function() onConfirm,
  String? cancelText,
  Function()? onCancel,
  Function()? onDismiss,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            child: Text(confirmText),
          ),
        ],
      );
    },
  ).then((value) => onDismiss?.call());
}
