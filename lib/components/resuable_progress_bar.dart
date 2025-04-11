import 'package:flutter/material.dart';

class ReusableProgressBar extends StatelessWidget {
  final double progress; // Progress value between 0.0 and 1.0
  final Color color; // The color of the progress bar

  // Constructor
  ReusableProgressBar({required this.progress, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: 10), // Margin around the progress bar
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // You can use a linear progress indicator
          LinearProgressIndicator(
            value: progress, // Set the progress
            backgroundColor:
                Colors.grey.shade300, // Background color of the progress bar
            valueColor: AlwaysStoppedAnimation<Color>(
                color), // Color of the progress bar
          ),
          SizedBox(height: 5), // Spacing below the progress bar
          Text(
            '${(progress * 100).toStringAsFixed(0)}%', // Display the progress percentage
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Reusable Progress Bar')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ReusableProgressBar(progress: 0.4, color: Colors.blue),
              ReusableProgressBar(progress: 0.7, color: Colors.green),
              ReusableProgressBar(progress: 0.9, color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
