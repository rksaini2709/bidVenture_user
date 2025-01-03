import 'package:flutter/material.dart';
import 'package:flutter_projects/Config/colors.dart';
import 'package:flutter_projects/Widgets/custom_text.dart';
import 'package:flutter_projects/widgets/spacing.dart';

class EventBookedCard extends StatelessWidget {
  const EventBookedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffF3F6F9),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: grayColor,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Circle with Balloon Image
                CircleAvatar(
                  radius: 32,
                  backgroundColor: whiteColor,
                  child: Image.asset("assets/icons/Balloons.png"),
                ),

                const HorizontalSpacing(width: 6),

                // Column with Event Name & Guest number
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'Birthday',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: greenColor),
                    CustomText(
                        text: '14 guest',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ],
                ),

                // Calendar icon with Date
                // const Row(
                //   children: [
                //     Icon(Icons.calendar_today, color: greenColor, size: 20),
                //     SizedBox(width: 4),
                //     CustomText(
                //         text: '14 Jan 2024',
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //         color: blackColor),
                //   ],
                // ),

                const Spacer(),

                const Column(
                  children: [
                    Row(
                      children: [
                        // total bids
                        CircleAvatar(
                            radius: 14,
                            backgroundColor: whiteColor,
                            child: CustomText(
                                text: "01",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff964B00))),

                        HorizontalSpacing(width: 10),

                        // View Details about booked event
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: whiteColor,
                          child: Icon(Icons.remove_red_eye, color: greenColor),
                        ),

                        HorizontalSpacing(width: 10),

                        // Forward Arrow icons
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: whiteColor,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: greenColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),

                    VerticalSpacing(height: 4),

                    // Calendar icon with Date
                    Row(
                      children: [
                        SizedBox(width: 4),
                        CustomText(
                            text: '14 Jan 2024',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                        HorizontalSpacing(width: 6),
                        Icon(Icons.calendar_today, color: greenColor, size: 20),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // "Event Booked" Label
          Positioned(
            top: -10,
            // left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const CustomText(
                text: 'Event Booked',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/Config/colors.dart';
// import 'package:flutter_projects/Widgets/custom_text.dart';
//
// class EventBookedCard extends StatelessWidget {
//   const EventBookedCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: const Color(0xffF3F6F9),
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: const [
//                 BoxShadow(
//                   color: grayColor,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Circle with Balloon Image
//                 CircleAvatar(
//                     radius: 30,
//                     backgroundColor: whiteColor,
//                     child: Image.asset("assets/icons/Balloons.png")),
//
//                 // Column with Event Name & Guest number
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                         text: 'Birthday',
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: greenColor),
//                     CustomText(
//                         text: '14 guest',
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: blackColor),
//                   ],
//                 ),
//
//                 // Calendar icon with Date
//                 const Row(
//                   children: [
//                     Icon(Icons.calendar_today, color: greenColor, size: 20),
//                     SizedBox(width: 4),
//                     CustomText(
//                         text: '14 Jan 2024',
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: blackColor),
//                   ],
//                 ),
//
//                 // View Details about booked event
//                 const CircleAvatar(
//                   radius: 20,
//                   // backgroundColor: Colors.green.shade100,
//                   backgroundColor: whiteColor,
//                   child: Icon(Icons.remove_red_eye, color: greenColor),
//                 ),
//
//                 // Forward Arrow
//                 const CircleAvatar(
//                   radius: 20,
//                   // backgroundColor: Colors.green.shade100,
//                   // backgroundColor: Color(0xffF3F6F9),
//                   backgroundColor: whiteColor,
//                   child: Icon(Icons.arrow_forward_ios, color: greenColor),
//                 ),
//               ],
//             ),
//           ),
//
//           // Top Left Container with Text
//           Positioned(
//             top: 1,
//             left: 1,
//             child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: const BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     bottomRight: Radius.circular(8),
//                   ),
//                 ),
//                 child: const CustomText(
//                     text: 'Event Booked',
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: whiteColor)),
//           ),
//         ],
//       ),
//     );
//   }
// }
