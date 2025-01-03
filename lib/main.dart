import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Config/get_navigation_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Transparent status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/splashScreen',
      initialRoute: '/bottomNavBar',
      // initialRoute: '/homeScreen',
      getPages: GetNavigationPath.pages,
    );
  }
}
