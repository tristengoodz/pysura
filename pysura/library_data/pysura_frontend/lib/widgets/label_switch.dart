import 'package:flutter/material.dart';

class LabelSwitch extends StatelessWidget {
  const LabelSwitch({
    super.key,
    required this.label,
    this.labelStyle,
    required this.isOn,
    required this.onChanged,
  });

  final String label;
  final TextStyle? labelStyle;
  final bool isOn;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: labelStyle ?? textTheme.bodyMedium,
        ),
        Switch(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isOn,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
