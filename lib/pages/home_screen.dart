import 'package:fit_track/cards/quickadd_card.dart';
import 'package:fit_track/controllers/food_controller.dart';
// import 'package:fit_track/widgets/quick_add_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FoodController()); // Initialize GetX controller

    return Scaffold(
      appBar: AppBar(title: const Text('FitTrack')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() => SummaryTile(
                  calories:
                      Get.find<FoodController>().dailySummaryCalories.value,
                  protein: Get.find<FoodController>().dailySummaryProtein.value,
                )),
            const SizedBox(height: 16),
            QuickAddCard(),
          ],
        ),
      ),
    );
  }
}

class SummaryTile extends StatelessWidget {
  final double calories;
  final double protein;

  const SummaryTile({required this.calories, required this.protein, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Today's Summary"),
        subtitle: Text("Calories: ${calories.toStringAsFixed(1)} kcal\n"
            "Protein: ${protein.toStringAsFixed(1)} g"),
      ),
    );
  }
}
