import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/styles.dart';
import '/pages/main/main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainPageController controller = Get.put(MainPageController());
    return Obx(
          () =>
          Scaffold(
            backgroundColor: kBackgroundColor,
            body: Center(
              child: Text(
                controller.title,
              ),
            ),
          ),
    );
  }
}