import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/pages/auth/login_page.dart';
import '/pages/auth/login_page_provider.dart';
import '/pages/main/home_page.dart';
import '/pages/main/home_page_provider.dart';
import '/pages/misc/splash_page.dart';
import '/pages/misc/error_page.dart';
import '/providers/auth_provider.dart';

const kSplashRoute = '/splash';
const kLoginRoute = '/login';
const kHomeRoute = '/home';

final router = GoRouter(
  initialLocation: kSplashRoute,
  redirect: (context, state) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.user == null) {
      return kLoginRoute;
    }
    return null;
  },
  errorPageBuilder: (context, state) => const MaterialPage(
    child: ErrorPage(),
  ),
  routes: [
    // Splash route
    GoRoute(
      path: kSplashRoute,
      pageBuilder: (context, state) => const MaterialPage(
        child: SplashPage(),
      ),
    ),
    // Login route
    GoRoute(
      path: kLoginRoute,
      pageBuilder: (context, state) => MaterialPage(
        child: ChangeNotifierProvider(
          create: (context) => LoginPageProvider(context),
          child: const LoginPage(),
        ),
      ),
    ),
    // Home route
    GoRoute(
      path: kHomeRoute,
      pageBuilder: (context, state) => MaterialPage(
        child: ChangeNotifierProvider(
          create: (context) => HomePageProvider(context: context),
          child: const HomePage(),
        ),
      ),
    ),
  ],
);
