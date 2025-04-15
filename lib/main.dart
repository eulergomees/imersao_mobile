import 'package:flutter/material.dart';
import 'package:imersao_mobile/ui/splash/splash_page.dart';

import '_core/configs/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashPage(),
    );
  }
}