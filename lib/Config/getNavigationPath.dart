import 'package:flutter_projects/NotificationScreen.dart';
import 'package:flutter_projects/Screens/Auth/LoginScreen.dart';
import 'package:flutter_projects/Screens/HomeScreen/HomeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/Auth/OtpVerify/VerificationScreen.dart';
import '../Screens/onBoadingScreen/OnBoadingScreen.dart';
import '../Screens/Auth/SplashScreen.dart';

class GetNavigationPath {
  static List<GetPage> get pages => [
        //  Splash Screen
        GetPage(name: "/splashScreen", page: () => const SplashScreen(),),

        // onBoading Screen
        GetPage(name: "/onBoadingScreen", page: () => const OnBoadingScreen(),),

        // login Screen
        GetPage(name: "/loginScreen", page: () => const LoginScreen()),

        // Verification Screen
        GetPage(
            name: "/verificationScreen",
            page: () => const VerificationScreen()),

        // Home Screen
        GetPage(name: "/homeScreen", page: () => const HomeScreen()),

        // Notification screen
        GetPage(name: "/notificationScreen", page: () => const NotificationScreen()),
      ];
}
