// import 'package:fit_track/models/food_items.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class FoodController extends GetxController {
//   var foods = <FoodItem>[].obs; // All food items
//   var filteredFoods = <FoodItem>[].obs; // Filtered search suggestions
//   var dailySummaryCalories = 0.0.obs;
//   var dailySummaryProtein = 0.0.obs;
//   //
//   var totalCalories = 0.0.obs;
//   var totalProtein = 0.0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadFoodData();
//   }

//   Future<void> loadFoodData() async {
//     try {
//       final String csvRaw = await rootBundle.loadString('assets/food_data.csv');
//       final lines = csvRaw.split('\n');

//       List<FoodItem> tempList = [];

//       for (int i = 1; i < lines.length; i++) {
//         final line = lines[i].trim();

//         if (line.isEmpty || !line.contains(',')) continue;

//         final parts = line.split(',');

//         // Skip if it doesn't have exactly 5 parts
//         if (parts.length != 5) continue;

//         try {
//           final item = FoodItem(
//             name: parts[0].trim(),
//             calories: double.parse(parts[1].trim()),
//             protein: double.parse(parts[2].trim()),
//             carbs: double.parse(parts[3].trim()),
//             fat: double.parse(parts[4].trim()),
//           );
//           tempList.add(item);
//         } catch (e) {
//           debugPrint('❌ Skipping line due to parse error: "$line"');
//         }
//       }

//       foods.value = tempList;
//       debugPrint("✅ Loaded ${foods.length} food items.");
//     } catch (e) {
//       debugPrint('Error loading food data: $e');
//     }
//   }

//   // Called when user types into the search bar
//   void searchFood(String query) {
//     if (query.isEmpty) {
//       filteredFoods.value = foods;
//     } else {
//       filteredFoods.value = foods
//           .where(
//               (item) => item.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   }

//   // Called when user selects and adds a food
//   void addToDailySummary(FoodItem item) {
//     dailySummaryCalories.value += item.calories;
//     dailySummaryProtein.value += item.protein;
//   }

//   // Optional: Reset daily values
//   void resetDailySummary() {
//     dailySummaryCalories.value = 0.0;
//     dailySummaryProtein.value = 0.0;
//   }
// }

import 'package:fit_track/models/food_items.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  // Original full food list
  var foods = <FoodItem>[].obs;

  // Filtered list shown in UI
  var filteredFoods = <FoodItem>[].obs;

  // Daily summary
  var dailySummaryCalories = 0.0.obs;
  var dailySummaryProtein = 0.0.obs;

  // Totals across all time (optional)
  var totalCalories = 0.0.obs;
  var totalProtein = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadFoodData();
  }

  /// Loads food data from CSV file
  Future<void> loadFoodData() async {
    try {
      final String csvRaw = await rootBundle.loadString('assets/food_data.csv');
      final lines = csvRaw.split('\n');

      List<FoodItem> tempList = [];

      for (int i = 1; i < lines.length; i++) {
        final line = lines[i].trim();

        if (line.isEmpty || !line.contains(',')) continue;

        final parts = line.split(',');

        if (parts.length != 5) continue;

        try {
          final item = FoodItem(
            name: parts[0].trim(),
            calories: double.parse(parts[1].trim()),
            protein: double.parse(parts[2].trim()),
            carbs: double.parse(parts[3].trim()),
            fat: double.parse(parts[4].trim()),
          );
          tempList.add(item);
        } catch (e) {
          debugPrint('❌ Skipping line due to parse error: "$line"');
        }
      }

      foods.value = tempList;
      filteredFoods.value = tempList; // Initialize filtered list
      debugPrint("✅ Loaded ${foods.length} food items.");
    } catch (e) {
      debugPrint('❌ Error loading food data: $e');
    }
  }

  /// Search by query
  void searchFood(String query) {
    if (query.isEmpty) {
      filteredFoods.value = foods;
    } else {
      filteredFoods.value = foods
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  /// Add selected food with grams input
  void addToDailySummary(FoodItem item, double grams) {
    final factor = grams / 100; // CSV is based on 100g
    dailySummaryCalories.value += item.calories * factor;
    dailySummaryProtein.value += item.protein * factor;

    totalCalories.value += item.calories * factor;
    totalProtein.value += item.protein * factor;
  }

  /// Optional: reset today's intake
  void resetDailySummary() {
    dailySummaryCalories.value = 0.0;
    dailySummaryProtein.value = 0.0;
  }
}
