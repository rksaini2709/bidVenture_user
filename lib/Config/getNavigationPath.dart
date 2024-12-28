import 'package:flutter_projects/NotificationScreen.dart';
import 'package:flutter_projects/Screens/Auth/LoginScreen.dart';
import 'package:flutter_projects/Screens/HomeScreen/HomeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../AnniversaryScreen.dart';
import '../BirthdayScreen.dart';
import '../CharityScreen.dart';
import '../CorporateScreen.dart';
import '../EngagementScreen.dart';
import '../MeetupScreen.dart';
import '../OthersScreen.dart';
import '../PreWeddingScreen.dart';
import '../ReunionsScreen.dart';
import '../Screens/Auth/OtpVerify/VerificationScreen.dart';
import '../Screens/onBoadingScreen/OnBoadingScreen.dart';
import '../Screens/Auth/SplashScreen.dart';
import '../WeddingScreen.dart';

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
