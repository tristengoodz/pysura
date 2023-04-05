import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';
import '../../../common/app_color.dart';
import '../../../common/app_text_style.dart';
import '../../../common/app_theme.dart';
import '../../../controllers/theme_controller.dart';
import 'settings_page_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsPageController>();
    final themeController = Get.find<ThemeController>();
    AppTheme.prepForThemeRefresh(context);

    return Obx(
      () => Scaffold(
        /// AppBar
        appBar: AppBar(
          elevation: 1,
          systemOverlayStyle: themeController.isDarkMode
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          centerTitle: true,
          title: Text(
            'Settings',
            style: GoogleFonts.poppins(
              textStyle: AppTextStyle.titleLarge,
              color: AppColor.onBackground,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.primary,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                const SizedBox(height: 32),

                /// Theme Color
                Row(
                  children: [
                    Text(
                      'Choose Theme Color',
                      style: GoogleFonts.poppins(
                        textStyle: AppTextStyle.bodyMedium,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        controller.selectThemeColor();
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: themeController.seedColor,
                          border: Border.all(
                            color: AppColor.onBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),

                /// Light/Dark Mode
                Row(
                  children: [
                    Text(
                      'Dark Mode',
                      style: GoogleFonts.poppins(
                        textStyle: AppTextStyle.bodyMedium,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: themeController.isDarkMode,
                      onChanged: (value) {
                        themeController.isDarkMode = value;
                      },
                    ),
                  ],
                ),
                const Divider(height: 40, thickness: 0.5),

                /// File Picker Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SecondaryButton(
                      title: 'Pick a file',
                      onPressed: () {
                        controller.pickFile();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: false,
                    ),

                    /// Token Copy Button
                    SecondaryButton(
                      title: 'Copy GraphQL Token',
                      onPressed: () {
                        controller.getToken();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: false,
                    ),
                  ],
                ),

                const Divider(height: 40, thickness: 0.5),

                /// Delete, Logout account
                Row(
                  children: [
                    SecondaryButton(
                      title: 'Delete Account',
                      onPressed: () {
                        controller.deleteAccount();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: false,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      title: 'Sign Out',
                      onPressed: () {
                        controller.signOut();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: false,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
