import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../Config/Colors.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  String _locationName = 'Fetching location...';
  bool _isLoading = false;

  // Fetch current location
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Method to fetch current location
  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {

      // Check for location permission
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {

        // Get current location
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        // Fetch address from coordinates (latitude, longitude) using geocoding
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        // If placemarks is not empty, we can construct the full address
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;

          // Constructing the full address
          String fullAddress =
              '${placemark.name ?? ''}, '
              '${placemark.street ?? ''}, '
              '${placemark.subLocality ?? ''}, '
              '${placemark.locality ?? ''}, '
              '${placemark.administrativeArea ?? ''}, '
              '${placemark.postalCode ?? ''}, '
              '${placemark.country ?? ''}';

          // Update the UI with the fetched location
          setState(() {
            _locationName =
                fullAddress.isNotEmpty ? fullAddress : 'Unknown location';
            _isLoading = false;
          });
        } else {
          setState(() {
            _locationName = 'No address found';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _locationName = 'Permission denied';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _locationName = 'Failed to fetch location';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: grayColor,
          child: Icon(
            Icons.location_on,
            color: primaryColor,
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: _getCurrentLocation,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              _locationName,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500),

              // Ensures that text wraps to the next line
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        // const SizedBox(width: 4),
        const Icon(
          Icons.arrow_forward_ios,
          color: blackColor,
          size: 15,
        ),
      ],
    );
  }
}