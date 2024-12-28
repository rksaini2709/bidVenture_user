import 'package:flutter/material.dart';
import 'package:flutter_projects/Config/Colors.dart';

class EventCategoryList extends StatelessWidget {
  const EventCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> events = [
      {
        'name': 'Birthday',
        'imagePath': 'assets/icons/Balloons.png',
        'routeName': '/birthdayScreen'
      },
      {
        'name': 'Engagement',
        'imagePath': 'assets/icons/Ring.png',
        'routeName': '/engagementScreen'
      },
      {
        'name': 'Anniversary',
        'imagePath': 'assets/icons/Gift.png',
        'routeName': '/anniversaryScreen'
      },
      {
        'name': 'Wedding',
        'imagePath': 'assets/icons/weddingCouple.png',
        'routeName': '/weddingScreen'
      },
      {
        'name': 'Pre Wedding',
        'imagePath': 'assets/icons/preWedding.png',
        'routeName': '/preWeddingScreen'
      },
      {
        'name': 'Meetup',
        'imagePath': 'assets/icons/community.png',
        'routeName': '/meetupScreen'
      },
      {
        'name': 'Charity',
        'imagePath': 'assets/icons/charity.png',
        'routeName': '/charityScreen'
      },
      {
        'name': 'Reunions',
        'imagePath': 'assets/icons/familyGathering.png',
        'routeName': '/reunionsScreen'
      },
      {
        'name': 'Corporate',
        'imagePath': 'assets/icons/coorportate.png',
        'routeName': '/corporateScreen'
      },
      {
        'name': 'Others',
        'imagePath': 'assets/icons/others.png',
        'routeName': '/othersScreen'
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        final event = events[index];
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, event['routeName']);
            },
            child: SizedBox(
                child: Column(children: [
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: whiteColor,
                        width: 2,
                      )
                  ),
                  child: Image.asset(
                    event['imagePath'],
                    height: 42,
                    width: 42,
                    // fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  event['name'],
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ])));
      },
    );
  }
}

//------------------------------------------------------------------------------
// class EventCategoryList extends StatelessWidget {
//   const EventCategoryList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> events = [
//       {'name': 'Birthday', 'imagePath': 'assets/icons/Balloons.png', 'routeName': '/birthdayScreen'},
//       {'name': 'Engagement', 'imagePath': 'assets/icons/Ring.png', 'routeName': '/engagementScreen'},
//       {'name': 'Anniversary', 'imagePath': 'assets/icons/Gift.png', 'routeName': '/anniversaryScreen'},
//       {'name': 'Wedding', 'imagePath': 'assets/icons/weddingCouple.png', 'routeName': '/weddingScreen'},
//       {'name': 'Pre Wedding', 'imagePath': 'assets/icons/preWedding.png', 'routeName': '/preWeddingScreen'},
//       {'name': 'Meetup', 'imagePath': 'assets/icons/community.png', 'routeName': '/meetupScreen'},
//       {'name': 'Charity', 'imagePath': 'assets/icons/charity.png', 'routeName': '/charityScreen'},
//       {'name': 'Reunions', 'imagePath': 'assets/icons/familyGathering.png', 'routeName': '/reunionsScreen'},
//       {'name': 'Corporate', 'imagePath': 'assets/icons/coorportate.png', 'routeName': '/corporateScreen'},
//       {'name': 'Others', 'imagePath': 'assets/icons/others.png', 'routeName': '/othersScreen'},
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: events.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 5,
//           crossAxisSpacing: 4,
//           mainAxisSpacing: 4,
//         ),
//         itemBuilder: (context, index) {
//           final event = events[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(context, event['routeName']);
//             },
//             child: Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(event['imagePath']),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     event['name'],
//                     style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// -----------------------------------------------------------------------------
// class EventCategoryList extends StatelessWidget {
//   const EventCategoryList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     // events Card list
//     final List<Map<String, dynamic>> events = [
//       {
//         'name': 'Birthday',
//         'imagePath': 'assets/icons/Balloons.png',
//         'routeName': '/birthdayScreen'
//       },
//       {
//         'name': 'Engagement',
//         'imagePath': 'assets/icons/Ring.png',
//         'routeName': '/engagementScreen'
//       },
//       {
//         'name': 'Anniversary',
//         'imagePath': 'assets/icons/Gift.png',
//         'routeName': '/anniversaryScreen'
//       },
//       {
//         'name': 'Wedding',
//         'imagePath': 'assets/icons/weddingCouple.png',
//         'routeName': '/weddingScreen'
//       },
//       {
//         'name': 'Pre Wedding',
//         'imagePath': 'assets/icons/preWedding.png',
//         'routeName': '/preWeddingScreen'
//       },
//       {
//         'name': 'Meetup',
//         'imagePath': 'assets/icons/community.png',
//         'routeName': '/meetupScreen'
//       },
//       {
//         'name': 'Charity',
//         'imagePath': 'assets/icons/charity.png',
//         'routeName': '/charityScreen'
//       },
//       {
//         'name': 'Reunions',
//         'imagePath': 'assets/icons/familyGathering.png',
//         'routeName': '/reunionsScreen'
//       },
//       {
//         'name': 'Corporate',
//         'imagePath': 'assets/icons/coorportate.png',
//         'routeName': '/corporateScreen'
//       },
//       {
//         'name': 'Others',
//         'imagePath': 'assets/icons/others.png',
//         'routeName': '/othersScreen'
//       },
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         // itemCount: events.length,
//         itemCount: 5,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 5,
//           crossAxisSpacing: 4,
//           mainAxisSpacing: 4,
//         ),
//         itemBuilder: (context, index) {
//           final event = events[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(context, event['routeName']);
//             },
//             child: Container(
//               color: Colors.red,
//               height: 90,
//               child: Column(
//                 children: [
//                   Container(
//
//                     // elevation: 2,
//                     // shape: RoundedRectangleBorder(
//                     //   borderRadius: BorderRadius.circular(8),
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(0),
//                       child: Image.asset(
//                         event['imagePath'],
//                         height: 20,
//                         width: 20,
//                         // fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   // const SizedBox(height: 8),
//                   Text(
//                     event['name'],
//                     style: const TextStyle(
//                         fontSize: 12, fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// -----------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flutter_projects/Config/Images.dart';
// import 'CategoryCard.dart';
//
// class EventCategoryList extends StatelessWidget {
//
//   // Category List Item
//   final List<Category> categories = [
//     Category(name: 'Birthday', imagePath: 'assets/images/Balloons.png', routeName: '/birthdayScreen'),
//     Category(name: 'Anniversary', imagePath: 'assets/images/Anniversary.png', routeName: '/anniversaryScreen'),
//   ];
//
//   EventCategoryList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//           crossAxisSpacing: 4,
//           mainAxisSpacing: 4,
//         ),
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           return CategoryCard(category: category);
//         },
//       ),
//     );
//   }
// }
