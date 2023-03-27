import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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