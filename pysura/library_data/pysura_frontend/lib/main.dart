import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/app_route.dart';
import 'common/app_theme.dart';
import 'controllers/auth_controller.dart';
import 'controllers/graphql_controller.dart';
import 'controllers/data_controller.dart';
import 'controllers/theme_controller.dart';
import 'widgets/graphql_provider_widget.dart';
import 'pages/misc/error_page.dart';
import 'pages/main/main_page_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Inject Common Controllers
  Get.put(AuthController());
  Get.put(GraphQLController());
  Get.put(DataController());
  Get.put(ThemeController());

  runApp(const GraphQLProviderWidget(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () {
        return GetMaterialApp(
          theme: AppTheme.fromSeedColor(
            themeController.seedColor,
          ),
          darkTheme: AppTheme.fromSeedColor(
            themeController.seedColor,
            darkMode: true,
          ),
          themeMode:
              themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.kSplashRoute,
          unknownRoute: GetPage(
            name: AppRoute.kErrorRoute,
            page: () => const ErrorPage(),
          ),
          getPages: AppRoute.setupPageRoutes(),
          initialBinding: BindingsBuilder(
            () {
              Get.put(MainPageController());
            },
          ),
        );
      },
    );
  }
}
