import 'package:flutter_projects/notification_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../anniversary_screen.dart';
import '../birthday_screen.dart';
import '../charity_screen.dart';
import '../corporate_screen.dart';
import '../engagement_screen.dart';
import '../meetup_screen.dart';
import '../others_screen.dart';
import '../pre_wedding_screen.dart';
import '../reunions_screen.dart';
import '../view/Auth/OtpVerify/VerificationScreen.dart';
import '../view/Auth/login_screen.dart';
import '../view/Auth/splash_screen.dart';
import '../view/home_screen/home_screen.dart';
import '../view/onBoadingScreen/on_boading_screen.dart';
import '../wedding_screen.dart';

class GetNavigationPath {
  static List<GetPage> get pages => [
        //  Splash Screen
        GetPage(
          name: "/splashScreen",
          page: () => const SplashScreen(),
        ),

        // onBoading Screen
        GetPage(
          name: "/onBoadingScreen",
          page: () => const OnBoadingScreen(),
        ),

        // login Screen
        GetPage(name: "/loginScreen", page: () => const LoginScreen()),

        // Verification Screen
        GetPage(
            name: "/verificationScreen",
            page: () => const VerificationScreen()),

        // Home Screen
        GetPage(name: "/homeScreen", page: () => const HomeScreen()),

        // Notification screen
        GetPage(
            name: "/notificationScreen",
            page: () => const NotificationScreen()),

        // birthday Screen
        GetPage(name: "/birthdayScreen", page: () => const BirthdayScreen()),

        // Engagement Screen
        GetPage(
            name: "/engagementScreen", page: () => const EngagementScreen()),

        // anniversary Screen
        GetPage(
            name: "/anniversaryScreen", page: () => const AnniversaryScreen()),

        // wedding Screen
        GetPage(name: "/weddingScreen", page: () => const WeddingScreen()),

        // preWedding Screen
        GetPage(
            name: "/preWeddingScreen", page: () => const PreWeddingScreen()),

        // meetup Screen
        GetPage(name: "/meetupScreen", page: () => const MeetupScreen()),

        // charity Screen
        GetPage(name: "/charityScreen", page: () => const CharityScreen()),

        // reunions screen
        GetPage(name: "/reunionsScreen", page: () => const ReunionsScreen()),

        // corporate screen
        GetPage(name: "/corporateScreen", page: () => const CorporateScreen()),

        // others screen
        GetPage(name: "/othersScreen", page: () => const OthersScreen()),
      ];
}
