import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/auth/login_page.dart';
import 'pages/auth/login_page_controller.dart';
import 'pages/main/main_page.dart';
import 'pages/main/main_page_controller.dart';
import 'pages/misc/error_page.dart';
import 'pages/misc/loading_page.dart';
import 'common/constants.dart';
import 'common/styles.dart';
import 'controllers/auth_controller.dart';
import 'controllers/graphql_controller.dart';
import 'widgets/graphql_provider_widget.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());
  Get.put(GraphqlController());

  runApp(GraphQLProviderWidget(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initApp = Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
  );

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: kMainTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initApp,
        builder: (context, appSnapshot) {
          if (appSnapshot.hasError) {
            return ErrorPage(
              message: appSnapshot.error.toString(),
            );
          }
          if (appSnapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }
          return appSnapshot.connectionState != ConnectionState.done
              ? const ErrorPage(message: 'No internet connection.')
              : StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (ctx, userSnapshot) {
                    if (userSnapshot.hasData) {
                      _deleteAuthPageControllers();
                      authController.user = FirebaseAuth.instance.currentUser!;
                      return const MainPage(); // changing this will change the default screen
                    } else {
                      _deleteMainPageControllers();
                      return const LoginPage();
                    }
                  },
                );
        },
      ),
    );
  }

  _deleteAuthPageControllers() {
    Get.delete<LoginPageController>();
  }

  _deleteMainPageControllers() {
    Get.delete<MainPageController>();
  }
}
