import 'package:flutter/material.dart';
import 'package:flutter_projects/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import '../Config/Colors.dart';
import 'add_screen.dart';
import 'event_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';


class BottomNavBarState extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Notify listeners to rebuild widgets
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavBarState(), // Provide the state
      child: Consumer<BottomNavBarState>(
        builder: (context, state, child) {
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: const [
                HomeScreen(),
                EventScreen(),
                HistoryScreen(),
                ProfileScreen(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: primaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddScreen()),
                );
              },
              child: const Icon(
                Icons.add_box,
                color: whiteColor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: ClipPath(
              clipper: DeepPunchHoleClipper(),
              child: BottomAppBar(
                color: secondaryColor,
                notchMargin: 8.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavBarIcon(
                      context,
                      Icons.home,
                      0,
                      state.currentIndex,
                    ),
                    _buildNavBarIcon(
                      context,
                      Icons.event,
                      1,
                      state.currentIndex,
                    ),
                    const SizedBox(width: 50), // Space for FAB
                    _buildNavBarIcon(
                      context,
                      Icons.history,
                      2,
                      state.currentIndex,
                    ),
                    _buildNavBarIcon(
                      context,
                      Icons.person,
                      3,
                      state.currentIndex,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper method to build navigation bar icons
  Widget _buildNavBarIcon(
      BuildContext context, IconData icon, int index, int currentIndex) {
    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color: index == currentIndex ? primaryColor : whiteColor,
      ),
      onPressed: () {
        context.read<BottomNavBarState>().setCurrentIndex(index);
      },
    );
  }
}

class DeepPunchHoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double fabRadius = 35; // Radius for the FAB
    const double punchHoleDepth = 22; // Depth of the punch hole
    const double punchHoleCurveRadius =
        30; // Curve radius for smooth punch hole

    Path path = Path();

    // Start from top-left
    path.moveTo(0, 0);
    path.lineTo(size.width / 2 - fabRadius - punchHoleCurveRadius, 0);

    // Start downward curve for the punch hole
    path.quadraticBezierTo(size.width / 2 - fabRadius, 0,
        size.width / 2 - fabRadius + 10, punchHoleDepth);

    // Arc for the deep punch hole
    path.arcToPoint(
      Offset(size.width / 2 + fabRadius - 10, punchHoleDepth),
      radius: const Radius.circular(fabRadius),
      clockwise: false,
    );

    // End upward curve for the punch hole
    path.quadraticBezierTo(size.width / 2 + fabRadius, 0,
        size.width / 2 + fabRadius + punchHoleCurveRadius, 0);

    // Continue to the top-right
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/view/home_screen/home_screen.dart';
// import '../Config/Colors.dart';
//
// // Import your screens
// import 'event_screen.dart';
// import 'history_screen.dart';
// import 'profile_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _currentIndex = 0;
//
//   // List of screens
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const EventScreen(),
//     const HistoryScreen(),
//     const ProfileScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         backgroundColor: primaryColor,
//         onPressed: () {
//           // Navigate to a new screen from FAB
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddScreen()),
//           );
//         },
//         child: const Icon(
//           Icons.add_box,
//           color: whiteColor,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: DeepPunchHoleClipper(),
//         child: BottomAppBar(
//           color: secondaryColor,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.home, size: 30, color: whiteColor),
//                 onPressed: () {
//                   setState(() {
//                     _currentIndex = 0;
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.event, size: 30, color: whiteColor),
//                 onPressed: () {
//                   setState(() {
//                     _currentIndex = 1;
//                   });
//                 },
//               ),
//               const SizedBox(width: 50), // Space for the FAB
//               IconButton(
//                 icon: const Icon(Icons.history, size: 30, color: whiteColor),
//                 onPressed: () {
//                   setState(() {
//                     _currentIndex = 2;
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.person, size: 30, color: whiteColor),
//                 onPressed: () {
//                   setState(() {
//                     _currentIndex = 3;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // DeepPunchHoleClipper remains the same
// class DeepPunchHoleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const double fabRadius = 35; // Radius for the FAB
//     const double punchHoleDepth = 22; // Depth of the punch hole
//     const double punchHoleCurveRadius = 30; // Curve radius for smooth punch hole
//
//     Path path = Path();
//
//     // Start from top-left
//     path.moveTo(0, 0);
//     path.lineTo(size.width / 2 - fabRadius - punchHoleCurveRadius, 0);
//
//     // Start downward curve for the punch hole
//     path.quadraticBezierTo(size.width / 2 - fabRadius, 0,
//         size.width / 2 - fabRadius + 10, punchHoleDepth);
//
//     // Arc for the deep punch hole
//     path.arcToPoint(
//       Offset(size.width / 2 + fabRadius - 10, punchHoleDepth),
//       radius: const Radius.circular(fabRadius),
//       clockwise: false,
//     );
//
//     // End upward curve for the punch hole
//     path.quadraticBezierTo(size.width / 2 + fabRadius, 0,
//         size.width / 2 + fabRadius + punchHoleCurveRadius, 0);
//
//     // Continue to the top-right
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
//
// // Placeholder screen for FAB
// class AddScreen extends StatelessWidget {
//   const AddScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Screen'),
//       ),
//       body: const Center(
//         child: Text('This is the screen for the FloatingActionButton!'),
//       ),
//     );
//   }
// }

// // Deeper Punch-Hole with Smooth Radius
//
// import 'package:flutter/material.dart';
// import 'package:flutter_projects/Config/Colors.dart';
//
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         backgroundColor: primaryColor,
//         onPressed: () {},
//         child: const Icon(
//           Icons.add_box,
//           color: whiteColor,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: DeepPunchHoleClipper(),
//         child: const BottomAppBar(
//           color: secondaryColor,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(
//                 Icons.home,
//                 size: 30,
//                 color: whiteColor,
//               ),
//               Icon(
//                 Icons.event,
//                 size: 30,
//                 color: whiteColor,
//               ),
//               SizedBox(width: 50),
//               Icon(
//                 Icons.history,
//                 size: 30,
//                 color: whiteColor,
//               ),
//               Icon(
//                 Icons.person,
//                 size: 30,
//                 color: whiteColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DeepPunchHoleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // Radius for the punch hole
//     const double fabRadius = 35;
//
//     // Depth of the punch hole
//     const double punchHoleDepth = 22;
//
//     // Smooth curve radius for punch hole
//     const double punchHoleCurveRadius = 30;
//
//     Path path = Path();
//
//     // Start from top-left
//     path.moveTo(0, 0);
//     path.lineTo(size.width / 2 - fabRadius - punchHoleCurveRadius, 0);
//
//     // Start downward curve for the punch hole
//     path.quadraticBezierTo(size.width / 2 - fabRadius, 0,
//         size.width / 2 - fabRadius + 10, punchHoleDepth);
//
//     // Arc for the deep punch hole
//     path.arcToPoint(
//       Offset(size.width / 2 + fabRadius - 10, punchHoleDepth),
//       radius: const Radius.circular(fabRadius),
//       clockwise: false,
//     );
//
//     // End upward curve for the punch hole
//     path.quadraticBezierTo(size.width / 2 + fabRadius, 0,
//         size.width / 2 + fabRadius + punchHoleCurveRadius, 0);
//
//     // Continue to the top-right
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/profile_screen.dart';
// import 'package:flutter_projects/view/home_screen/home_screen.dart';
//
// import '../Config/Colors.dart';
// import 'event_screen.dart';
// import 'history_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//
//   // List of pages to display in the bottom navigation
//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const EventScreen(),
//     const HistoryScreen(),
//     const ProfileScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//
//       // FloatingActionButton placed inside the punch hole at the top-center
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         elevation: 8,
//         backgroundColor: primaryColor,
//         onPressed: () {},
//         child: const Icon(
//           Icons.add_box,
//           color: whiteColor,
//         ),
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       resizeToAvoidBottomInset: false,
//
//       bottomNavigationBar: ClipPath(
//         clipper: BottomNavClipper(),  // Custom clipper for punch hole effect
//         child: Container(
//           height: 90,
//           color: secondaryColor,
//           child: BottomNavigationBar(
//             items: const [
//               //  home Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Explore',
//               ),
//               // Events Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_month_outlined),
//                 label: 'Events',
//               ),
//               // History Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.history),
//                 label: 'History',
//               ),
//               // Profile Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: whiteColor,
//             unselectedItemColor: grayColor,
//             backgroundColor: secondaryColor,
//             onTap: _onItemTapped,
//             type: BottomNavigationBarType.fixed,
//             selectedIconTheme: const IconThemeData(size: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Custom clipper for the punch hole at top-center
// class BottomNavClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//
//     // Create a rectangular path for the navigation bar
//     path.addRRect(RRect.fromRectAndRadius(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       Radius.circular(30),
//     ));
//
//     // Create a hole at the top-center
//     path.addOval(Rect.fromCircle(
//       center: Offset(size.width / 2, 2), // Position the hole at the top-center
//       radius: 35, // Radius of the hole
//     ));
//
//     path.fillType = PathFillType.evenOdd; // Make sure the hole is cut out
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/profile_screen.dart';
// import 'package:flutter_projects/view/home_screen/home_screen.dart';
//
// import '../Config/Colors.dart';
// import 'event_screen.dart';
// import 'history_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//
//   // List of pages to display in the bottom navigation
//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const EventScreen(),
//     const HistoryScreen(),
//     const ProfileScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//
//       // FloatingActionButton placed inside the punch hole
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         elevation: 8,
//         backgroundColor: primaryColor,
//         onPressed: () {},
//         child: const Icon(
//           Icons.add_box,
//           color: whiteColor,
//         ),
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       resizeToAvoidBottomInset: false,
//
//       bottomNavigationBar: ClipPath(
//         clipper: BottomNavClipper(),  // Custom clipper for punch hole effect
//         child: Container(
//           height: 90,
//           color: secondaryColor,
//           child: BottomNavigationBar(
//             items: const [
//               //  home Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Explore',
//               ),
//               // Events Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_month_outlined),
//                 label: 'Events',
//               ),
//               // History Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.history),
//                 label: 'History',
//               ),
//               // Profile Screen
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: whiteColor,
//             unselectedItemColor: grayColor,
//             onTap: _onItemTapped,
//             type: BottomNavigationBarType.fixed,
//             selectedIconTheme: const IconThemeData(size: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Custom clipper for the punch hole effect
// class BottomNavClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//
//     // Create a punch hole in the center
//     path.addRRect(RRect.fromRectAndRadius(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       Radius.circular(30),
//     ));
//
//     // Draw a circle cut-out in the center
//     path.addOval(Rect.fromCircle(
//       center: Offset(size.width / 2, size.height - 20), // Position the hole at the bottom-center
//       radius: 35,
//     ));
//
//     path.fillType = PathFillType.evenOdd; // Make sure the hole is cut out
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/view/home_screen/home_screen.dart';
// import '../Config/Colors.dart';
// import 'event_screen.dart';
// import 'history_screen.dart';
// import 'profile_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const EventScreen(),
//     const HistoryScreen(),
//     const ProfileScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         backgroundColor: primaryColor,
//         onPressed: () {},
//         child: const Icon(
//           Icons.qr_code_scanner,
//           color: whiteColor,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: BottomNavClipper(),
//         child: Container(
//           height: 90,
//           color: secondaryColor,
//           child: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_today),
//                 label: 'Events',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.history),
//                 label: 'History',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: whiteColor,
//             unselectedItemColor: grayColor,
//             backgroundColor: secondaryColor,
//             onTap: _onItemTapped,
//             type: BottomNavigationBarType.fixed,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BottomNavClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final double holeRadius = 40.0;
//     final double holeCenterY = -10.0;
//     final double controlPointY = 1.0;
//
//     Path path = Path()
//       ..moveTo(0, 0)
//       ..lineTo((size.width / 2) - (holeRadius * 2), 0)
//       ..quadraticBezierTo(
//         size.width / 2, controlPointY,
//         (size.width / 2) + (holeRadius * 2), 0,
//       )
//       ..lineTo(size.width, 0)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..close();
//
//     path.addOval(Rect.fromCircle(
//       center: Offset(size.width / 2, holeCenterY),
//       radius: holeRadius,
//     ));
//
//     path.fillType = PathFillType.evenOdd;
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/view/home_screen/home_screen.dart';
// import '../Config/Colors.dart';
// import 'event_screen.dart';
// import 'history_screen.dart';
// import 'profile_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const EventScreen(),
//     const HistoryScreen(),
//     const ProfileScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         backgroundColor: primaryColor,
//         onPressed: () {},
//         child: const Icon(
//           Icons.qr_code_scanner,
//           color: whiteColor,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: BottomNavClipper(),
//         child: Container(
//           height: 90,
//           color: secondaryColor,
//           child: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_today),
//                 label: 'Events',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.history),
//                 label: 'History',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: whiteColor,
//             unselectedItemColor: grayColor,
//             backgroundColor: secondaryColor,
//             onTap: _onItemTapped,
//             type: BottomNavigationBarType.fixed,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BottomNavClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double holeRadius = 35.0;
//     double curveDepth = 30.0;
//     double curveWidth = 80.0;
//
//     Path path = Path();
//
//     // Start from the left corner
//     path.moveTo(0, 0);
//     path.lineTo((size.width / 2) - (curveWidth / 2) - holeRadius, 0);
//
//     // Top-left curve into the punch hole
//     path.quadraticBezierTo(
//       (size.width / 2) - curveWidth / 2,
//       curveDepth,
//       size.width / 2 - holeRadius,
//       curveDepth,
//     );
//
//     // Create the circular punch hole
//     path.arcToPoint(
//       Offset(size.width / 2 + holeRadius, curveDepth),
//       radius: Radius.circular(holeRadius),
//       clockwise: false,
//     );
//
//     // Top-right curve out of the punch hole
//     path.quadraticBezierTo(
//       (size.width / 2) + curveWidth / 2,
//       curveDepth,
//       (size.width / 2) + (curveWidth / 2) + holeRadius,
//       0,
//     );
//
//     // Complete to the right corner
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/view/home_screen/home_screen.dart';
// import '../Config/Colors.dart';
// import 'event_screen.dart';
// import 'history_screen.dart';
// import 'profile_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//
//   // List of pages to display in the bottom navigation
//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const EventScreen(),
//     const HistoryScreen(),
//     const ProfileScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//
//       // FloatingActionButton placed inside the punch hole at the top-center
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         elevation: 8,
//         backgroundColor: primaryColor,
//         onPressed: () {},
//         child: const Icon(
//           Icons.add,
//           color: whiteColor,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//       bottomNavigationBar: Stack(
//         children: [
//           ClipPath(
//             clipper: BottomNavClipper(), // Custom clipper for punch hole effect
//             child: Container(
//               height: 90,
//               color: secondaryColor,
//             ),
//           ),
//           BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Explore',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_month_outlined),
//                 label: 'Events',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.history),
//                 label: 'History',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: whiteColor,
//             unselectedItemColor: grayColor,
//             onTap: _onItemTapped,
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.transparent, // Make background transparent
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Custom clipper for the punch hole at top-center
// class BottomNavClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//
//     // Create a rectangular path for the navigation bar
//     path.addRRect(RRect.fromRectAndCorners(
//       Rect.fromLTRB(0, 0, size.width, size.height),
//       topLeft: const Radius.circular(30),
//       topRight: const Radius.circular(30),
//     ));
//
//     // Create a hole at the top-center
//     path.addOval(Rect.fromCircle(
//       center: Offset(size.width / 2, 0), // Position the hole at the top-center
//       radius: 35, // Radius of the hole
//     ));
//
//     path.fillType = PathFillType.evenOdd; // Make sure the hole is cut out
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/Config/Colors.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryColor,
//         onPressed: () {},
//         child: Icon(Icons.add, color: Colors.white,),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: StandardClipper(),
//         child: BottomAppBar(
//           color: secondaryColor,
//           // color: Colors.white,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home, color: whiteColor,),
//               Icon(Icons.event, color: whiteColor,),
//               SizedBox(width: 50),
//               Icon(Icons.history, color: whiteColor,),
//               Icon(Icons.person, color: whiteColor,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class StandardClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width / 2 - 40, 0);
//     path.arcToPoint(
//       Offset(size.width / 2 + 40, 0),
//       radius: Radius.circular(40),
//       clockwise: false,
//     );
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// Standard Punch-Hole FAB Centered

// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.green,
//         onPressed: () {},
//         child: Icon(Icons.camera_alt),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: ElevatedClipper(),
//         child: BottomAppBar(
//           color: Colors.white,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home),
//               Icon(Icons.search),
//               SizedBox(width: 50),
//               Icon(Icons.settings),
//               Icon(Icons.person),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ElevatedClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width / 2 - 50, 0);
//     path.quadraticBezierTo(
//         size.width / 2, 50, size.width / 2 + 50, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

//  Elevated FAB with Extended Punch-Hole

// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.green,
//         onPressed: () {},
//         child: Icon(Icons.camera_alt),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: ElevatedClipper(),
//         child: BottomAppBar(
//           color: Colors.white,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home),
//               Icon(Icons.event),
//               SizedBox(width: 50),
//               Icon(Icons.history),
//               Icon(Icons.person),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ElevatedClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width / 2 - 50, 0);
//     path.quadraticBezierTo(
//         size.width / 2, 50, size.width / 2 + 50, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// FAB Inside a Semi-Oval Indentation

// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blue,
//         onPressed: () {},
//         child: Icon(Icons.add_a_photo),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: OvalClipper(),
//         child: BottomAppBar(
//           color: Colors.white,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.dashboard),
//               Icon(Icons.explore),
//               SizedBox(width: 50),
//               Icon(Icons.message),
//               Icon(Icons.person),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class OvalClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width / 2 - 60, 0);
//     path.arcToPoint(
//       Offset(size.width / 2 + 60, 0),
//       radius: Radius.circular(50),
//       clockwise: false,
//     );
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// Detached FAB with Overlapping Punch-Hole

// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.orange,
//         onPressed: () {},
//         child: Icon(Icons.edit),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       bottomNavigationBar: ClipPath(
//         clipper: DetachedClipper(),
//         child: BottomAppBar(
//           color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home),
//               Icon(Icons.search),
//               SizedBox(width: 50),
//               Icon(Icons.favorite),
//               Icon(Icons.settings),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DetachedClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width / 2 - 40, 0);
//     path.arcToPoint(
//       Offset(size.width / 2 + 40, 0),
//       radius: Radius.circular(30),
//       clockwise: false,
//     );
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// FAB in a Concave Wave Design

// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.brown,
//         onPressed: () {},
//         child: Icon(Icons.play_arrow),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: WaveClipper(),
//         child: BottomAppBar(
//           color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home),
//               Icon(Icons.star),
//               SizedBox(width: 50),
//               Icon(Icons.work),
//               Icon(Icons.person),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width / 2 - 60, 0);
//     path.quadraticBezierTo(
//         size.width / 2, 60, size.width / 2 + 60, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// Smooth Rounded Punch-Hole Navigation Bar with Radius

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/Config/Colors.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.purple,
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: RoundedPunchClipper(),
//         child: BottomAppBar(
//           // color: Colors.white,
//           color: secondaryColor,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home, size: 30),
//               Icon(Icons.search, size: 30),
//               SizedBox(width: 50), // Space for FAB
//               Icon(Icons.notifications, size: 30),
//               Icon(Icons.person, size: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RoundedPunchClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final double fabRadius = 35; // Radius of the FAB punch-hole
//     final double cornerRadius = 20; // Radius for corners
//
//     Path path = Path();
//
//     // Start from the top-left corner with a rounded curve
//     path.moveTo(0, cornerRadius);
//     path.quadraticBezierTo(0, 0, cornerRadius, 0);
//
//     // Draw up to the FAB punch-hole start
//     path.lineTo(size.width / 2 - fabRadius - 10, 0);
//     path.arcToPoint(
//       Offset(size.width / 2 + fabRadius + 10, 0),
//       radius: Radius.circular(fabRadius),
//       clockwise: false,
//     );
//
//     // Continue to the top-right corner
//     path.lineTo(size.width - cornerRadius, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
//
//     // Move to the bottom-right corner
//     path.lineTo(size.width, size.height - cornerRadius);
//     path.quadraticBezierTo(
//         size.width, size.height, size.width - cornerRadius, size.height);
//
//     // Bottom-left corner
//     path.lineTo(cornerRadius, size.height);
//     path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);
//
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }

// Radius Only Around Punch-Hole in Bottom Navigation Bar

// import 'package:flutter/material.dart';
// import 'package:flutter_projects/Config/Colors.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.purple,
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ClipPath(
//         clipper: PunchHoleClipper(),
//         child: const BottomAppBar(
//           // color: Colors.white,
//           color: secondaryColor,
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home, size: 30),
//               Icon(Icons.search, size: 30),
//               SizedBox(width: 50), // Space for FAB
//               Icon(Icons.notifications, size: 30),
//               Icon(Icons.person, size: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PunchHoleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const double fabRadius = 25;// Punch-hole radius
//     const double punchHoleCurveRadius = 15; // Radius for the punch-hole curve
//
//     Path path = Path();
//
//     // Start from top-left
//     path.moveTo(0, 0);
//     path.lineTo(size.width / 2 - fabRadius - punchHoleCurveRadius, 0);
//
//     // Start curve for the punch hole
//     path.quadraticBezierTo(
//         size.width / 2 - fabRadius,
//         0,
//         size.width / 2 - fabRadius + 10,
//         punchHoleCurveRadius
//     );
//
//     path.arcToPoint(
//       Offset(size.width / 2 + fabRadius - 10, punchHoleCurveRadius),
//       radius: Radius.circular(fabRadius),
//       clockwise: false,
//     );
//
//     // End curve for the punch hole
//     path.quadraticBezierTo(
//         size.width / 2 + fabRadius,
//         0,
//         size.width / 2 + fabRadius + punchHoleCurveRadius,
//         0
//     );
//
//     // Continue to the top-right
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }
