import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;

  // Constructor with default values
  const SmallText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.w100,
    this.color = Colors.black,
    this.fontSize = 14.0, // Default font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
