import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/primary_button.dart';
import '../../../common/app_theme.dart';
import '../../../controllers/theme_controller.dart';
import '../../../common/app_color.dart';
import '../../../common/app_text_style.dart';
import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
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
            'Home',
            style: GoogleFonts.poppins(
              textStyle: AppTextStyle.titleLarge,
              color: AppColor.onBackground,
            ),
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {
                  controller.goToSettings();
                },
                padding: const EdgeInsets.all(2),
                icon: Icon(
                  Icons.settings,
                  color: AppColor.primary,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Query
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Query',
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: AppColor.onBackground,
                        ),
                      ),
                    ),
                    PrimaryButton(
                      title: 'Run Query',
                      onPressed: () {
                        controller.runQuery();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: controller.loading,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                /// Query Result Box
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.onSurface.withOpacity(0.12),
                    ),
                  ),
                  child: Text(
                    'I said ${controller.queryResult}',
                    style: AppTextStyle.bodySmall.copyWith(
                      color: AppColor.onBackground,
                    ),
                    maxLines: 5,
                  ),
                ),
                const SizedBox(height: 32),

                /// Mutation
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Mutation',
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: AppColor.onBackground,
                        ),
                      ),
                    ),
                    PrimaryButton(
                      title: 'Run Mutation',
                      onPressed: () {
                        controller.runMutation();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: controller.loading,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                /// Mutation Inputs and Outputs
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.onSurface.withOpacity(0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller:
                                  controller.messageTextEditingController,
                              decoration:
                                  AppTextStyle.generateTextFieldDecoration(
                                      'Message', 'You message'),
                              style: AppTextStyle.bodySmall,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller:
                                  controller.numberTextEditingController,
                              decoration:
                                  AppTextStyle.generateTextFieldDecoration(
                                      'Number', 'You number'),
                              style: AppTextStyle.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'I said ${controller.mutationResult}',
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColor.onBackground,
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                /// Subscription
                Text(
                  'Subscription',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: AppColor.onBackground,
                  ),
                ),
                const SizedBox(height: 8),

                /// Subscription Result Box
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.onSurface.withOpacity(0.12),
                    ),
                  ),
                  child: Text(
                    'I said ${controller.subscriptionResult}',
                    style: AppTextStyle.bodySmall.copyWith(
                      color: AppColor.onBackground,
                    ),
                    maxLines: 5,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
