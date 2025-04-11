// lib/widgets/meals_today_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/meal_controller.dart';

class MealsTodayCard extends StatelessWidget {
  MealsTodayCard({super.key});

  final MealController mealController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: const [
                  Icon(Icons.restaurant, size: 20, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Meals Today',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Meal Content
            Padding(
              padding: const EdgeInsets.all(24).copyWith(top: 16),
              child: Obx(() => Column(
                    children: [
                      _buildMealItem('Breakfast',
                          '${mealController.getTotalCalories("Breakfast").toStringAsFixed(0)} kcal'),
                      const SizedBox(height: 12),
                      _buildMealItem('Lunch',
                          '${mealController.getTotalCalories("Lunch").toStringAsFixed(0)} kcal'),
                      const SizedBox(height: 12),
                      _buildMealItem('Snack',
                          '${mealController.getTotalCalories("Snack").toStringAsFixed(0)} kcal'),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealItem(String mealName, String calories) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mealName,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
            ),
          ),
          Text(
            calories,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
