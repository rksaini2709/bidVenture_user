import 'package:flutter/material.dart';
import 'package:flutter_projects/Config/Images.dart';
import 'package:flutter_projects/Screens/HomeScreen/currentLocation.dart';
import 'package:get/get.dart';

import '../../Config/Colors.dart';
import 'ImageCarousel.dart';

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
        actions: [
          IconButton(
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

              const SizedBox(height: 16,),
              // Image.asset(AssetsImages.hotelImage),

              // hotel banners Carousel
              // ImageCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}