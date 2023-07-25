import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/app_config.dart';
import 'common/app_route.dart';
import 'common/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/graphql_provider.dart';
import 'providers/theme_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Hive
  await AppConfig.init();

  /// Remove # from web url path
  if (kIsWeb) {
    setPathUrlStrategy();
  }

  /// Init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => GraphqlProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, __) {
        final isDarkMode = themeProvider.isDarkMode;
        final seedColor = themeProvider.seedColor;
        return ChangeNotifierProvider(
          create: (context) => AuthProvider(
            context: context,
            goRouter: router,
          ),
          child: MaterialApp.router(
            theme: AppTheme.fromSeedColor(
              seedColor,
            ),
            darkTheme: AppTheme.fromSeedColor(
              seedColor,
              darkMode: true,
            ),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
