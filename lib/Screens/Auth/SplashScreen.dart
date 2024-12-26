import 'package:flutter/material.dart';
import 'package:flutter_projects/Config/Colors.dart';
import 'package:get/get.dart';

import '../../Config/Images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed('/onBoadingScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:
            Image.asset("assets/images/bidVentureLogo.png"),
            // Image.asset(AssetsImages.logo),
          )
      ),
    );
  }
}
