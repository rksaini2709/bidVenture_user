import 'package:flutter/material.dart';
import 'package:flutter_projects/Widgets/CustomText.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final VoidCallback onPressed;
  final Color btnColor;
  final double width;

  const PrimaryBtn(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.textColor,
      required this.onPressed,
      required this.btnColor,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
          ),
          child: CustomText(
              text: text,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor)),
    );
  }
}
