// import 'package:flutter/cupertino.dart';
//
// class ImageCarousel extends StatefulWidget {
//   @override
//   _ImageCarouselState createState() => _ImageCarouselState();
// }
//
// class _ImageCarouselState extends State<ImageCarousel> {
//   // List of image assets (use relative path from the 'assets' directory)
//   final List<String> _imageAssets = [
//     "assets/images/Hotel.png",
//     "assets/images/Hotel.png",
//   ];
//
//   // Controller for PageView
//   PageController _pageController = PageController();
//
//   // Function to automatically move the carousel to the next image
//   void _autoSlide() {
//     Future.delayed(Duration(seconds: 3), () {
//       if (_pageController.hasClients) {
//         int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
//         if (nextPage >= _imageAssets.length) nextPage = 0;
//         _pageController.animateToPage(
//           nextPage,
//           duration: Duration(seconds: 1),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _autoSlide(); // Start the auto slide when the widget is created
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 300, // Fixed height for the carousel
//       child: PageView.builder(
//         controller: _pageController,
//         itemCount: _imageAssets.length,
//         itemBuilder: (context, index) {
//           return Image.asset(
//             _imageAssets[index],
//             fit: BoxFit.cover,
//           );
//         },
//         onPageChanged: (index) {
//           _autoSlide(); // Reset the auto slide when the page is changed
//         },
//       ),
//     );
//   }
// }