import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/main/main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainPageController controller = Get.put(MainPageController());

    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          centerTitle: false,
          leading: const Icon(Icons.home),
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  controller.signOut();
                },
                icon: const Icon(Icons.logout))
          ]),
    );
  }
}
