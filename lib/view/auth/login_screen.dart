import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/Widgets/primary_btn.dart';
import 'package:get/get.dart';

import '../../../../Config/colors.dart';
import '../../../../Config/images.dart';
import '../../Widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonEnabled = false;

  // Phone Number Validation (Should be only 10 digits number)
  void _validatePhoneNumber(String phone) {
    setState(() {
      _isButtonEnabled =
          phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 76),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsImages.loginImage),
              const CustomText(
                  text: "Login",
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: blackColor),
              Padding(
                padding: const EdgeInsets.only(top: 41),
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: _validatePhoneNumber,
                    decoration: InputDecoration(
                      counterText: '',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/icons/IndianFlag.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 5),
                            const CustomText(
                                text: '+91',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: blackColor),
                          ],
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                      hintText: 'Enter your Number',
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: grayColor,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: secondaryColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: blackColor),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              PrimaryBtn(
                text: "Next",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textColor: whiteColor,
                btnColor: secondaryColor,
                width: double.infinity,
                // If the number is valid then navigate to VerificationScreen
                onPressed: _isButtonEnabled
                    ? () {
                        Get.toNamed('/verificationScreen');
                      }
                    : () {
                        // snackbar to show that Entered number is invalid
                        Get.snackbar(
                          "Invalid Number",
                          "Please enter a valid 10-digit phone number.",
                          backgroundColor: secondaryColor,
                          colorText: whiteColor,
                        );
                      },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// bottom Snack Bar
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   bool _isButtonEnabled = false;
//
//   // Phone Number Validation ( Should be only 10 digits number )
//   void _validatePhoneNumber(String phone) {
//     setState(() {
//       _isButtonEnabled =
//           phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone);
//     });
//   }
//
//   // show snack bar that plz enter first a valid number
//   void _showSnackBarInvalidNumber() {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       content: Text("Please enter a valid 10-digit phone number."),
//       duration: Duration(seconds: 2),));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(AssetsImages.loginImage),
//               // Image.asset("assets/images/login.png"),
//               const CustomText(
//                   text: "Login",
//                   fontSize: 25,
//                   fontWeight: FontWeight.w800,
//                   color: blackColor),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 41,
//                 ),
//                 child: SizedBox(
//                   height: 60,
//                   child: TextFormField(
//                     controller: _phoneController,
//                     keyboardType: TextInputType.phone,
//                     maxLength: 10,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     onChanged: _validatePhoneNumber,
//                     decoration: InputDecoration(
//                       counterText: '',
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Indian flag icon
//                             Image.asset(
//                               // AssetsImages.indianFlag,
//                               'assets/icons/IndianFlag.png',
//                               width: 24,
//                               height: 24,
//                               fit: BoxFit.cover,
//                             ),
//                             const SizedBox(width: 5),
//                             const CustomText(
//                                 text: '+91',
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: blackColor),
//                           ],
//                         ),
//                       ),
//                       prefixIconConstraints: const BoxConstraints(
//                         minWidth: 0,
//                         minHeight: 0,
//                       ),
//                       hintText: 'Enter your Number',
//                       hintStyle: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                         color: grayColor,
//                       ),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(),
//                       ),
//                       focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(color: primaryColor),
//                       ),
//                       enabledBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(color: blackColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               PrimaryBtn(
//                 text: "Next",
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//                 textColor: whiteColor,
//                 btnColor: primaryColor,
//                 width: double.infinity,
//
//                 onPressed: _isButtonEnabled
//                     ? () {
//                   Get.toNamed('/VerificationScreen');
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => const VerificationScreen(),
//                   //   ),
//                   // );
//                 }
//                     : _showSnackBarInvalidNumber,
//                 // (){},
//
//                 // onPressed: _isButtonEnabled ? () {
//                 //   Navigator.push(
//                 //             context,
//                 //             MaterialPageRoute(
//                 //                 builder: (context) => const VerificationScreen()));
//                 // } : null,
//
//                 //     () {
//                 //   Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //           builder: (context) => const VerificationScreen()));
//                 // },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// show PopUp if entered number is invalid
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   bool _isButtonEnabled = false;
//
//   // Phone Number Validation ( Should be only 10 digits number )
//   void _validatePhoneNumber(String phone) {
//     setState(() {
//       _isButtonEnabled =
//           phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone);
//     });
//   }
//
//   // Show AlertDialog when the phone number is invalid
//   void _showInvalidPhoneNumberDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Invalid Number"),
//           content: const Text("Please enter a valid 10-digit phone number."),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();  // Close the dialog
//               },
//               child: const Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(AssetsImages.loginImage),
//               const CustomText(
//                   text: "Login",
//                   fontSize: 25,
//                   fontWeight: FontWeight.w800,
//                   color: blackColor),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 41,
//                 ),
//                 child: SizedBox(
//                   height: 60,
//                   child: TextFormField(
//                     controller: _phoneController,
//                     keyboardType: TextInputType.phone,
//                     maxLength: 10,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     onChanged: _validatePhoneNumber,
//                     decoration: InputDecoration(
//                       counterText: '',
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset(
//                               'assets/icons/IndianFlag.png',
//                               width: 24,
//                               height: 24,
//                               fit: BoxFit.cover,
//                             ),
//                             const SizedBox(width: 5),
//                             const CustomText(
//                                 text: '+91',
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: blackColor),
//                           ],
//                         ),
//                       ),
//                       prefixIconConstraints: const BoxConstraints(
//                         minWidth: 0,
//                         minHeight: 0,
//                       ),
//                       hintText: 'Enter your Number',
//                       hintStyle: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                         color: grayColor,
//                       ),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(),
//                       ),
//                       focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(color: primaryColor),
//                       ),
//                       enabledBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(color: blackColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               PrimaryBtn(
//                 text: "Next",
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//                 textColor: whiteColor,
//                 btnColor: primaryColor,
//                 width: double.infinity,
//
//                 // If button is disabled, show the AlertDialog
//                 onPressed: _isButtonEnabled
//                     ? () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const VerificationScreen(),
//                     ),
//                   );
//                 }
//                     : _showInvalidPhoneNumberDialog, // Show AlertDialog on invalid number
//
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
