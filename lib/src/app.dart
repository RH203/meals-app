import 'package:flutter/material.dart';
import 'package:meals_app/src/router/router.dart';
import 'package:meals_app/src/utils/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Meals app",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: AppRouter.router,
    );
  }
}
