import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

enum HapticFeedbackType {
  light,
  medium,
  heavy,
  selection,
  vibrate,
}

haptic({required HapticFeedbackType type}) {
  switch (type) {
    case HapticFeedbackType.light:
      HapticFeedback.lightImpact();
      break;
    case HapticFeedbackType.medium:
      HapticFeedback.mediumImpact();
      break;
    case HapticFeedbackType.heavy:
      HapticFeedback.heavyImpact();
      break;
    case HapticFeedbackType.selection:
      HapticFeedback.selectionClick();
      break;
    case HapticFeedbackType.vibrate:
      HapticFeedback.vibrate();
      break;
  }
}

appLog(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

Future<String?> pickFileAsString() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  final path = result?.files.single.path;
  if (path != null) {
    File file = File(path);
    final bytes = await file.readAsBytes();
    final encodedText = base64Encode(bytes);
    return encodedText;
  } else {
    return null;
  }
}
