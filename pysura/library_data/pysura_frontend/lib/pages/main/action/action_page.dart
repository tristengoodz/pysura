import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/primary_button.dart';
import '../../../common/app_color.dart';
import '../../../common/app_text_style.dart';
import '../../../common/app_theme.dart';
import '../../../controllers/theme_controller.dart';
import 'action_page_controller.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ActionPageController>();
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
            'Action',
            style: GoogleFonts.poppins(
              textStyle: AppTextStyle.titleLarge,
              color: AppColor.onBackground,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Action Query Ping
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Action Query Ping',
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: AppColor.onBackground,
                        ),
                      ),
                    ),
                    PrimaryButton(
                      title: 'Ping',
                      onPressed: () {
                        controller.ping();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: controller.loading,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                /// Action Query Ping Input and Output
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
                                  controller.queryMessageTextEditingController,
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
                                  controller.queryNumberTextEditingController,
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
                        'I said ${controller.queryResult}',
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColor.onBackground,
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                /// Action Mutation Pong
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Action Mutation Pong',
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: AppColor.onBackground,
                        ),
                      ),
                    ),
                    PrimaryButton(
                      title: 'Pong',
                      onPressed: () {
                        controller.pong();
                      },
                      textStyle: AppTextStyle.bodyMedium,
                      isBusy: controller.loading,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                /// Action Query Ping Input and Output
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
                              controller: controller
                                  .mutationMessageTextEditingController,
                              decoration:
                                  AppTextStyle.generateTextFieldDecoration(
                                      'Message', 'You message'),
                              style: AppTextStyle.bodySmall,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: controller
                                  .mutationNumberTextEditingController,
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

                /// Event Message
                Text(
                  'Event Message',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: AppColor.onBackground,
                  ),
                ),
                const SizedBox(height: 8),

                /// Event Message Ouput
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
                    'Time since ping: 0s',
                    style: AppTextStyle.bodySmall.copyWith(
                      color: AppColor.onBackground,
                    ),
                    maxLines: 5,
                  ),
                ),
                const SizedBox(height: 32),

                /// Cron Message
                Text(
                  'Cron Message',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: AppColor.onBackground,
                  ),
                ),
                const SizedBox(height: 8),

                /// Cron Message Ouput
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
                    'Cron Message',
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
