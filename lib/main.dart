import 'package:fit_track/controllers/daily_summary_controller.dart';
import 'package:fit_track/controllers/food_controller.dart';
import 'package:fit_track/controllers/meal_controller.dart';
import 'package:fit_track/pages/homepage.dart';
import 'package:fit_track/pages/main_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Get.put(FoodController());
  Get.put(FoodController());
  Get.put(DailySummaryController());
  Get.put(MealController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fit-Track',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      home: MainNavbar(),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}
