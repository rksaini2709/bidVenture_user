import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Config/Colors.dart';

class CustomOtpTextField extends StatelessWidget {
  final int numberOfFields;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final VoidCallback? onConfirm;

  const CustomOtpTextField({
    super.key,
    this.numberOfFields = 4,
    this.controller,
    required this.onChanged,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController internalController =
        controller ?? TextEditingController();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child:
          // Text Field for enter OTP
          TextField(
            controller: internalController,
            keyboardType: TextInputType.number,
            maxLength: numberOfFields,
            decoration: InputDecoration(
              hintText: 'Enter OTP',
              hintStyle: const TextStyle(color: grayColor),
              prefixIcon: const Icon(
                Icons.security,
                color: secondaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: blackColor, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: secondaryColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            if (internalController.text.length == numberOfFields) {
              onConfirm?.call();
            } else {
              Get.snackbar(
                "Invalid OTP",
                "Please enter a valid $numberOfFields-digit OTP",
                backgroundColor: secondaryColor,
                colorText: whiteColor,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
          ),
          child: const Text(
            "Confirm",
            style: TextStyle(
              fontSize: 16,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}