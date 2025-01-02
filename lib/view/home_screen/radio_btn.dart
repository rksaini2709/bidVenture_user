import 'package:flutter/material.dart';

import '../../Config/colors.dart';
import '../../Widgets/custom_text.dart';

class RadioBtn extends StatefulWidget {
  const RadioBtn({super.key});

  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(title: const Text('Radio Button in Container')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RadioBtnCard('Birthday Party', 'birthday_party'),
              RadioBtnCard('Engagement Party', 'engagement_party'),
              RadioBtnCard('Anniversary Party', 'anniversary_party'),
              RadioBtnCard('Wedding Party', 'wedding_party'),
              RadioBtnCard('Pre-Wedding Party', 'pre_wedding_party'),
              RadioBtnCard('Meetup Party', 'meetup_party'),
              RadioBtnCard('Charity Event', 'charity_event'),
              RadioBtnCard('Reunions Event', 'reunions_event'),
              RadioBtnCard('Corporate Event', 'corporate_event'),
              RadioBtnCard('Other Event', 'other_event'),
            ],
          ),
        ),
      ),
    );
  }

  Widget RadioBtnCard(String text, String value) {
    return Container(
      // color: const Color(0xffF5F5FA),
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        // color: Colors.white,
        color: const Color(0xffF5F5FA),
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: grayColor,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
          ),
          const SizedBox(width: 8),
          CustomText(
              text: text,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: blackColor)
        ],
      ),
    );
  }
}
