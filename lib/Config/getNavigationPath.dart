import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/onBoadingScreen/OnBoadingScreen.dart';
import '../Screens/Auth/SplashScreen.dart';

class GetNavigationPath {
  static List<GetPage> get pages => [
        GetPage(name: "/splashScreen", page: () => const SplashScreen()),
        GetPage(name: "/onBoadingScreen", page: () => const OnBoadingScreen()),
      ];
}
