import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;

  // Constructor with default values
  const BigText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontSize = 20.0, // Default font size
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
