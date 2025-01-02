import 'package:flutter/cupertino.dart';

class VerticalSpacing extends StatelessWidget {
  final double height;
  const VerticalSpacing({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

// horizontal spacing
class HorizontalSpacing extends StatelessWidget {
  final double width;
  const HorizontalSpacing({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
