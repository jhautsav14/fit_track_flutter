import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart'; // Make sure to import the Lucide Icons package

// Reusable Progress Bar widget
class ReusableProgressBar extends StatelessWidget {
  final double progress; // Progress value between 0.0 and 1.0
  final Color color; // Color of the progress bar

  ReusableProgressBar({
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the parent container
      height: 8, // Height of the progress bar
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        color: Colors.grey[300], // Background color (unfilled portion)
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(8), // Rounded corners for the filled part
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor:
              progress, // Sets the width based on progress (0.0 to 1.0)
          child: Container(
            height: 8,
            color: color, // The color of the progress bar
          ),
        ),
      ),
    );
  }
}

// InfoRow widget with progress bar
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double progress; // Progress value between 0.0 and 1.0
  final Color iconColor;
  final Color progressBarColor;
  final FontWeight valueFontWeight;

  InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.progress,
    this.iconColor = Colors.redAccent,
    this.progressBarColor = Colors.green, // Default color for the progress bar
    this.valueFontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Text(
              value,
              style: TextStyle(fontWeight: valueFontWeight, fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: 10),
        ReusableProgressBar(
          progress: progress, // Pass the progress value
          color: progressBarColor, // Pass the progress bar color
        ),
      ],
    );
  }
}
