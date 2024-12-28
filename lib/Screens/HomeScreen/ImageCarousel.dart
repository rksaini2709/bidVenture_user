import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/Config/Colors.dart';
import 'package:flutter_projects/Widgets/PrimaryBtn.dart';
import '../../Config/Images.dart';
import '../../Widgets/CustomText.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {

  // List of images for the carousel
  final List<String> imgList = [
    AssetsImages.hotelImage,
    AssetsImages.hotelImage,
    AssetsImages.hotelImage,
    AssetsImages.hotelImage,
    AssetsImages.hotelImage,
  ];

  // Current index of the carousel
  int _currentIndex = 0;

  // Flag to toggle autoplay on/off
  bool isAutoPlayEnabled = true;

  // Function to toggle autoplay on and off
  void toggleAutoPlay() {
    setState(() {
      isAutoPlayEnabled = !isAutoPlayEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CarouselSlider widget
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: isAutoPlayEnabled,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            aspectRatio: 20 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: imgList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(imageUrl, fit: BoxFit.cover),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),

        const SizedBox(
          height: 10,
        ),

        // Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imgList.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? primaryColor : grayColor),
            ),
          ),
        ),

        // const SizedBox(
        //   height: 10,
        // ),
        //
        // // Toggle Button to enable/disable autoplay
        // PrimaryBtn(
        //     text: isAutoPlayEnabled
        //         ? "Disable Auto Slide image"
        //         : "Enable Auto Slide image",
        //     fontSize: 16,
        //     fontWeight: FontWeight.w600,
        //     textColor: whiteColor,
        //     onPressed: toggleAutoPlay,
        //     btnColor: secondaryColor,
        //     width: double.infinity),
      ],
    );
  }
}
//------------------------------------------------------------------------------
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';  // Ensure Material package is imported
//
// class ImageCarousel extends StatefulWidget {
//   const ImageCarousel({super.key});
//
//   @override
//   State<ImageCarousel> createState() => _ImageCarouselState();
// }
//
// class _ImageCarouselState extends State<ImageCarousel> {
//   final List<String> imgList = [
//     'assets/images/Hotel.png',
//     'assets/images/Hotel.png',
//   ];
//
//   int _currentIndex = 0;  // To track the current image index
//   bool isAutoPlayEnabled = true;  // To toggle autoplay
//
//   // Function to handle autoplay toggle
//   void toggleAutoPlay() {
//     setState(() {
//       isAutoPlayEnabled = !isAutoPlayEnabled;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CarouselSlider(
//           options: CarouselOptions(
//             autoPlay: isAutoPlayEnabled,  // Use the current autoplay state
//             autoPlayInterval: const Duration(seconds: 3),
//             enlargeCenterPage: true,
//             aspectRatio: 28 / 20,
//             viewportFraction: 0.95,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentIndex = index;  // Update the current index
//               });
//             },
//           ),
//           items: imgList.map((imageUrl) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: Stack(
//                     children: [
//                       Image.asset(imageUrl, fit: BoxFit.cover),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//         ),
//
//         // Add a row of dots to indicate the active page
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             imgList.length,
//                 (index) => AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               margin: const EdgeInsets.symmetric(horizontal: 5),
//               height: 10,
//               width: 10,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _currentIndex == index
//                     ? Theme.of(context).primaryColor // Active dot color
//                     : Colors.grey.withOpacity(0.5), // Inactive dot color
//               ),
//             ),
//           ),
//         ),
//
//         // Add a button to toggle autoplay
//         IconButton(
//           icon: Icon(isAutoPlayEnabled ? Icons.pause : Icons.play_arrow),
//           onPressed: toggleAutoPlay,  // Toggle autoplay
//         ),
//       ],
//     );
//   }
// }
//------------------------------------------------------------------------------
// import 'dart:async';  // For Timer
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class ImageCarousel extends StatefulWidget {
//   const ImageCarousel({super.key});
//
//   @override
//   _ImageCarouselState createState() => _ImageCarouselState();
// }
//
// class _ImageCarouselState extends State<ImageCarousel> {
//   final List<String> imgList = [
//     'assets/images/Hotel.png',
//     'assets/images/Hotel.png',
//     'assets/images/Hotel.png',
//     'assets/images/Hotel.png',
//     'assets/images/Hotel.png',
//   ];
//
//   int _currentIndex = 0;
//   late Timer _timer;  // Timer for auto sliding
//
//   @override
//   void initState() {
//     super.initState();
//     // Start the auto slide timer
//     _startAutoSlide();
//   }
//
//   // Function to start auto sliding the carousel
//   void _startAutoSlide() {
//     _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
//       if (_currentIndex < imgList.length - 1) {
//         _currentIndex++;
//       } else {
//         _currentIndex = 0;  // Reset to the first image
//       }
//       // Change the carousel slide
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the timer when the widget is disposed
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // CarouselSlider
//           CarouselSlider.builder(
//             itemCount: imgList.length,
//             itemBuilder: (BuildContext context, int index, int realIndex) {
//               return Image.asset(
//                 imgList[index],
//                 fit: BoxFit.cover, // Optionally add BoxFit for better image scaling
//               );
//             },
//             options: CarouselOptions(
//               enlargeCenterPage: true,
//               viewportFraction: 1.0,
//               scrollPhysics: const BouncingScrollPhysics(),
//               scrollDirection: Axis.horizontal,
//               reverse: true, // For right-to-left scrolling
//               initialPage: _currentIndex,  // Set initial page based on _currentIndex
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _currentIndex = index; // Update the index on page change
//                 });
//               },
//             ),
//           ),
//
//           // Dots indicator
//           const SizedBox(height: 8), // Space between carousel and dots
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               imgList.length,
//                   (index) => AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 height: 10,
//                 width: 10,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _currentIndex == index
//                       ? Theme.of(context).primaryColor // Active dot color
//                       : Colors.grey.withOpacity(0.5), // Inactive dot color
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//------------------------------------------------------------------------------
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class ImageCarousel extends StatelessWidget {
//   final List<String> imgList = [
//     'assets/images/Hotel.png',
//     'assets/images/Hotel.png',
//   ];
//
//   ImageCarousel({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CarouselSlider.builder(
//         itemCount: imgList.length,
//         itemBuilder: (BuildContext context, int index, int realIndex) {
//           return Image.asset(
//             imgList[index],
//             // fit: BoxFit.cover,
//           );
//         },
//         options: CarouselOptions(
//           // height: 160,
//           enlargeCenterPage: true,
//           viewportFraction: 1.0,
//           scrollPhysics: const BouncingScrollPhysics(),  // Add physics for smooth scrolling
//           scrollDirection: Axis.horizontal, // Default is horizontal, so this is just for clarity
//           reverse: true, // This ensures the carousel scrolls from right to left
//         ),
//       ),
//     );
//   }
// }
