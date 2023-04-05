import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.page,
          onTap: controller.onBottomMenuTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.run_circle_outlined),
              label: 'Action',
            ),
          ],
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const ClampingScrollPhysics(),
          onPageChanged: controller.onPageChanged,
          children: controller.mainPageItems,
        ),
      ),
    );
  }
}
