import 'package:flutter/material.dart';

import '../../Config/colors.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/primary_btn.dart';

class PageContent extends StatelessWidget {
  final String image;
  final String event;
  final String description;
  final String btnText;
  final Color btnColor;
  final double width;

  const PageContent({
    super.key,
    required this.image,
    required this.event,
    required this.description,
    required this.btnText,
    required this.btnColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              const SizedBox(
                height: 50,
              ),
              CustomText(
                  text: event,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: blackColor),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
