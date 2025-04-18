import 'package:flutter/material.dart';
import 'package:imersao_mobile/ui/splash/splash_page.dart';
import 'package:provider/provider.dart';

import '_core/configs/theme/app_theme.dart';
import 'data/restaurant_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => restaurantData)],
      child: MyApp(),
    ),
  );
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
