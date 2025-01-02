import 'package:flutter/material.dart';
import 'package:flutter_projects/Widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Config/colors.dart';
import 'event_book/event_booked_card.dart';
import 'event_category_list.dart';
import 'image_carousel.dart';
import 'current_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: "BidVenchure",
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: secondaryColor),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Get.toNamed("/notificationScreen");
              },
              icon: const CircleAvatar(
                backgroundColor: grayColor,
                child: Icon(
                  Icons.notifications,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                // Fetch Current Location
                const CurrentLocation(),
                const SizedBox(height: 20),

                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Hotel banners Carousel
                const ImageCarousel(),
                const SizedBox(height: 20),

                // Event Category List
                const EventCategoryList(),
                const SizedBox(height: 20),

                // Start Bidding & See Property First btn row
                Padding(
                  // padding: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffEC0E52),
                            fixedSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Get.to(() => const EventBookingForm());
                            Get.toNamed("eventBookingForm");
                          },
                          child: const CustomText(
                            text: "Start Bidding",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff38C558),
                            fixedSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            print("Second Button Pressed");
                          },
                          child: const CustomText(
                            text: "See Property First",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                //
                const EventBookedCard(),
                const SizedBox(height: 20),

                // eatting bear Animation
                Lottie.asset(
                  'assets/animation/eat_food.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                // Burger  Animation
                Lottie.asset(
                  'assets/animation/Burger.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                // dishes Animation
                Lottie.asset(
                  'assets/animation/dishes.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                // in a circle, show of food items that is changes within a time period
                Lottie.asset(
                  'assets/animation/food_menu.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                // cooking animation
                Lottie.asset(
                  'assets/animation/cooking.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                //  veg or non-veg toggle animation
                Lottie.asset(
                  'assets/animation/veg_nonVeg.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                // food option animation
                Lottie.asset(
                  'assets/animation/food_option.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
