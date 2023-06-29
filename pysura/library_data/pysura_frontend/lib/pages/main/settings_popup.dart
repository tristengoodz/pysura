import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/constants.dart';
import '/common/utils.dart';
import '/providers/theme_provider.dart';
import '/providers/auth_provider.dart';
import '/widgets/label_switch.dart';
import '/widgets/secondary_button.dart';

class SettingsPopup extends StatelessWidget {
  const SettingsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final containerWidth = width > Constants.kMinWidth ? width / 2 : width;
    final containerHeight = height;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Dialog(
      child: Container(
        width: containerWidth,
        constraints: BoxConstraints(
          maxHeight: containerHeight,
        ),
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: colorScheme.secondary,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Title
              Row(
                children: [
                  Text(
                    'Settings',
                    style: textTheme.titleMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Light/Dark Mode',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(height: 8),
              LabelSwitch(
                label: 'Dark Mode Active',
                isOn: themeProvider.isDarkMode,
                onChanged: (newValue) {
                  themeProvider.isDarkMode = newValue;
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Color',
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(height: 8),
              Row(
                children: [
                  Text(
                    'Active Theme Color',
                    style: textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showColorPicker(
                        context,
                        themeProvider.seedColor,
                        onPicked: (newColor) {
                          if (newColor != null) {
                            themeProvider.seedColor = newColor;
                          }
                        },
                      );
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(
                        right: 6,
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        color: themeProvider.seedColor,
                        border: Border.all(
                          color: colorScheme.onBackground,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SecondaryButton(
                onPressed: () {
                  showAlertDialog(
                    context,
                    title: 'Logout',
                    content: 'Are you sure that you want to log out?',
                    confirmText: 'Continue',
                    onConfirm: () {
                      Navigator.of(context).pop();
                      authProvider.signOut();
                    },
                  );
                },
                title: 'Logout',
                textStyle: textTheme.bodyMedium!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
