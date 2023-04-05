import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'action/action_page.dart';
import 'home/home_page.dart';

class MainPageController extends GetxController {
  final _page = 0.obs;
  int get page => _page.value;
  set page(int value) => _page.value = value;

  late final PageController pageController;

  List<Widget> get mainPageItems {
    return const [
      HomePage(),
      ActionPage(),
    ];
  }

  @override
  onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  onBottomMenuTapped(int page) {
    pageController.jumpToPage(page);
  }

  onPageChanged(int page) {
    this.page = page;
  }
}
