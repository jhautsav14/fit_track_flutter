// // lib/controllers/daily_summary_controller.dart
// import 'package:get/get.dart';
// import 'food_controller.dart';

// class DailySummaryController extends GetxController {
//   final FoodController foodController = Get.find();

//   var caloriesValue = '0 / 2000 kcal'.obs;
//   var proteinValue = '0 / 50 g'.obs;
//   var stepsValue = '0 / 10,000'.obs;

//   var caloriesProgress = 0.0.obs;
//   var proteinProgress = 0.0.obs;
//   var stepsProgress = 0.0.obs;

//   final double calorieGoal = 2000;
//   final double proteinGoal = 50;
//   final int stepsGoal = 10000;

//   @override
//   void onInit() {
//     super.onInit();
//     ever(foodController.dailySummaryCalories, (_) => updateCalories());
//     ever(foodController.dailySummaryProtein, (_) => updateProtein());

//     // Assuming you're setting steps manually
//     updateSteps(7543); // Example: use actual steps from pedometer or user
//   }

//   void updateCalories() {
//     final current = foodController.dailySummaryCalories.value;
//     caloriesValue.value =
//         '${current.toStringAsFixed(0)} / ${calorieGoal.toStringAsFixed(0)} kcal';
//     caloriesProgress.value = (current / calorieGoal).clamp(0.0, 1.0);
//   }

//   void updateProtein() {
//     final current = foodController.dailySummaryProtein.value;
//     proteinValue.value =
//         '${current.toStringAsFixed(1)} / ${proteinGoal.toStringAsFixed(0)} g';
//     proteinProgress.value = (current / proteinGoal).clamp(0.0, 1.0);
//   }

//   void updateSteps(int currentSteps) {
//     stepsValue.value =
//         '${_formatNumber(currentSteps)} / ${_formatNumber(stepsGoal)}';
//     stepsProgress.value = (currentSteps / stepsGoal).clamp(0.0, 1.0);
//   }

//   String _formatNumber(num number) {
//     return number.toString().replaceAllMapped(
//           RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
//           (match) => '${match[1]},',
//         );
//   }
// }
// lib/controllers/daily_summary_controller.dart
import 'package:get/get.dart';
import 'food_controller.dart';

class DailySummaryController extends GetxController {
  final FoodController foodController = Get.find();

  // Display values
  var caloriesValue = '0 / 2000 kcal'.obs;
  var proteinValue = '0 / 120 g'.obs;
  var stepsValue = '0 / 10,000'.obs;

  // Progress values
  var caloriesProgress = 0.0.obs;
  var proteinProgress = 0.0.obs;
  var stepsProgress = 0.0.obs;

  // ✅ Goals with default values
  var calorieGoal = 2000.0.obs;
  var proteinGoal = 120.0.obs;
  var stepsGoal = 10000.obs;

  @override
  void onInit() {
    super.onInit();
    ever(foodController.dailySummaryCalories, (_) => updateCalories());
    ever(foodController.dailySummaryProtein, (_) => updateProtein());

    // Default steps, you can update this dynamically via pedometer or UI
    updateSteps(100);
  }

  // 🔁 Update calorie text & progress
  void updateCalories() {
    final current = foodController.dailySummaryCalories.value;
    caloriesValue.value =
        '${current.toStringAsFixed(0)} / ${calorieGoal.value.toStringAsFixed(0)} kcal';
    caloriesProgress.value = (current / calorieGoal.value).clamp(0.0, 1.0);
  }

  // 🔁 Update protein text & progress
  void updateProtein() {
    final current = foodController.dailySummaryProtein.value;
    proteinValue.value =
        '${current.toStringAsFixed(1)} / ${proteinGoal.value.toStringAsFixed(0)} g';
    proteinProgress.value = (current / proteinGoal.value).clamp(0.0, 1.0);
  }

  // 🔁 Update steps text & progress
  void updateSteps(int currentSteps) {
    stepsValue.value =
        '${_formatNumber(currentSteps)} / ${_formatNumber(stepsGoal.value)}';
    stepsProgress.value = (currentSteps / stepsGoal.value).clamp(0.0, 1.0);
  }

  // ✅ Goal setter method
  void setGoal({String type = '', double value = 0}) {
    switch (type) {
      case 'calories':
        calorieGoal.value = value;
        updateCalories(); // Recalculate display
        break;
      case 'protein':
        proteinGoal.value = value;
        updateProtein();
        break;
      case 'steps':
        stepsGoal.value = value.toInt();
        updateSteps((stepsProgress.value * stepsGoal.value.toInt()) as int);
        break;
    }
  }

  // 🔢 Format 10000 -> 10,000
  String _formatNumber(num number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
        );
  }
}
