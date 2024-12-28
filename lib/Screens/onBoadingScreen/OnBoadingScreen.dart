import 'package:flutter/material.dart';
import 'package:flutter_projects/Config/Colors.dart';
import 'package:flutter_projects/Widgets/PrimaryBtn.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Auth/LoginScreen.dart';
import 'PageContent.dart';

class OnBoadingScreen extends StatefulWidget {
  const OnBoadingScreen({super.key});

  @override
  State<OnBoadingScreen> createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          // PageView - switch between pages
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: const [
                // Bday Page
                PageContent(
                  // image: AssetsImages.bdayImage,
                  image: 'assets/images/Bday.jpg',
                  event: 'Happy Birthday!',
                  description: 'Celebrate your special day with love and joy!',
                  btnText: 'Next',
                  btnColor: lightBlueColor,
                  width: double.infinity,
                ),

                //  Anniversary Page
                PageContent(
                  // image: AssetsImages.anniversaryImage,
                  // image: 'assets/images/Anniversary.png',
                  image: 'assets/images/Aniversary.png',
                  event: 'Happy Anniversary!',
                  description:
                      'Cherish the love and memories of a beautiful journey together.',
                  btnText: 'Next',
                  btnColor: greenColor,
                  width: double.infinity,
                ),

                // Wedding page
                PageContent(
                  // image: AssetsImages.weddingImage,
                  image: 'assets/images/Wedding.png',
                  event: 'Congratulations on Your Wedding!',
                  description: 'Wishing you a lifetime of love and happiness.',
                  btnText: 'finish',
                  btnColor: redColor,
                  width: double.infinity,
                ),
              ],
            ),
          ),

          //   3 Dot Indicator
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? primaryColor : grayColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),

          // onboading Btn
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 50),
            child: PrimaryBtn(
                text: _currentPage == 2 ? 'Finish' : 'Next',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textColor: whiteColor,
                onPressed: () {
                  if (_currentPage == 2) {
                    Get.toNamed('/loginScreen');
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    // );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                // btn colors
                btnColor: _currentPage == 2
                    ? redColor
                    : (_currentPage == 1 ? greenColor : lightBlueColor),
                width: double.infinity),
          )
        ],
      ),
    );
  }
}
