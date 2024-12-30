import 'package:flutter/material.dart';
import 'package:flutter_projects/Config/images.dart';
import 'package:flutter_projects/Widgets/custom_text.dart';
import 'package:flutter_projects/Widgets/primary_btn.dart';
import 'package:get/get.dart';
import '../../Config/colors.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              const SizedBox(height: 30),

              // Event Category List
              const EventCategoryList(),
              const SizedBox(height: 10),

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
                          print("First Button Pressed");
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
              )
            ],
          ),
        ),
      ),
    );
  }
}