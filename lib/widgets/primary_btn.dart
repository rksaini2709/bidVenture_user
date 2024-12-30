import 'package:flutter/material.dart';
import 'package:flutter_projects/Widgets/custom_text.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final VoidCallback onPressed;
  final Color btnColor;
  final double width;
  final double height;

  const PrimaryBtn(
      {super.key,
        required this.text,
        required this.fontSize,
        required this.fontWeight,
        required this.textColor,
        required this.onPressed,
        required this.btnColor,
        required this.width,
        this.height = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: CustomText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
