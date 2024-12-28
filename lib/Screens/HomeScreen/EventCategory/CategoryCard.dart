// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CategoryCard extends StatelessWidget {
//   const CategoryCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(event['imagePath']),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             event['name'],
//             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     ),
//   }
// }










// import 'package:flutter/material.dart';
//
// class Category {
//   final String name;
//   final String imagePath;
//   final String routeName;
//
//   Category({required this.name, required this.imagePath, required this.routeName});
// }
//
// class CategoryCard extends StatelessWidget {
//   final Category category;
//   final double cardSize;
//
//   const CategoryCard({super.key, required this.category, required this.cardSize});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Card Navigation
//         Navigator.pushNamed(context, category.routeName);
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Card with a square shape
//           Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child:
//             Container(
//               width: cardSize, // Use the card size passed from the parent
//               height: cardSize, // Ensure the height matches the width (square)
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(category.imagePath),
//                   fit: BoxFit.cover, // Ensures the image fills the square
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//           const SizedBox(height: 4),
//           // Text below the card
//           SizedBox(
//             width: cardSize, // Ensure the text width matches the card width
//             child: Text(
//               category.name,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }












// import 'package:flutter/material.dart';
//
// // required item for Category Card
// class Category {
//   final String name;
//   final String imagePath;
//   final String routeName;
//
//   Category({required this.name, required this.imagePath, required this.routeName});
// }
//
// class CategoryCard extends StatelessWidget {
//   final Category category;
//
//   const CategoryCard({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//
//         // Card Navigation
//         Navigator.pushNamed(context, category.routeName);
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//
//           // Card with a square shape
//           Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(category.imagePath),
//                     // fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           // Text below the card
//           SizedBox(
//             child: Text(
//               category.name,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
