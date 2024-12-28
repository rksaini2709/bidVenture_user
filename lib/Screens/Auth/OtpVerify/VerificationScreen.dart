import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Config/Colors.dart';
import '../../../../Config/Images.dart';
import 'CustomOtpTextField.dart';
import '../../../Widgets/CustomText.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  VerificationScreenState createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpValid = false;

  // Otp check Validity
  void _checkOtpValidity(String value) {
    setState(() {
      _isOtpValid = value.length == 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Verification Image
              Image.asset("assets/images/Verification.png"),
              const CustomText(
                  text: "Otp Verification",
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: blackColor),

              const SizedBox(
                height: 60,
              ),

              // Custom Otp Text Field Widgets
              CustomOtpTextField(
                controller: _otpController,
                numberOfFields: 4,
                onChanged: _checkOtpValidity,
                onConfirm: () {
                  if (_isOtpValid) {
                    Get.toNamed("/homeScreen");
                  } else {
                    Get.snackbar(
                      "Invalid OTP",
                      "Please enter a valid 4-digit OTP",
                      backgroundColor: secondaryColor,
                      colorText: whiteColor,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const CustomText(
                  text: "Didn’t receive Code?",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: blackColor),
              const SizedBox(
                height: 5,
              ),
              const CustomText(
                  text: "Resend again",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: lightBlueColor),
            ],
          ),
        ),
      ),
    );
  }
}