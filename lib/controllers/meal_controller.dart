// lib/controllers/meal_controller.dart
import 'package:fit_track/models/meal_items_model.dart';
import 'package:get/get.dart';

class MealController extends GetxController {
  var meals = <String, List<MealItem>>{
    'Breakfast': [],
    'Lunch': [],
    'Snack': [],
  }.obs;

  void addMealItem(MealItem item) {
    final hour = DateTime.now().hour;
    String mealType;

    if (hour < 11) {
      mealType = 'Breakfast';
    } else if (hour < 17) {
      mealType = 'Lunch';
    } else {
      mealType = 'Snack';
    }

    meals[mealType]?.add(item);
    meals.refresh(); // Important to trigger UI updates
  }

  double getTotalCalories(String mealType) {
    final items = meals[mealType] ?? [];
    return items.fold(0.0, (sum, item) => sum + item.calories);
  }
}
