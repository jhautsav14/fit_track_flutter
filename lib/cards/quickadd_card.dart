// import 'package:flutter/material.dart';

// class QuickAddCard extends StatelessWidget {
//   const QuickAddCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Theme.of(context).cardColor,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             spreadRadius: 0,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Header with gradient
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.bolt, // Using Flutter's built-in bolt icon
//                   size: 20,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Quick Add',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Poppins',
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Content area
//           Padding(
//             padding: const EdgeInsets.all(24).copyWith(top: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Add Food',
//                   style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 10),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide:
//                                 const BorderSide(color: Color(0xFFEFF6FF)),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide:
//                                 const BorderSide(color: Color(0xFFEFF6FF)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide:
//                                 const BorderSide(color: Color(0xFF93C5FD)),
//                           ),
//                           hintText: 'e.g., Chicken Salad',
//                           hintStyle: const TextStyle(fontFamily: 'Montserrat'),
//                         ),
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'Montserrat',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Container(
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: null,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 10),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                         ),
//                         child: const Text(
//                           'Add',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/widgets/quick_add_card.dart

import 'package:fit_track/controllers/food_controller.dart';
import 'package:fit_track/controllers/meal_controller.dart';
import 'package:fit_track/models/meal_items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/food_items.dart';

class QuickAddCard extends StatelessWidget {
  const QuickAddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.find();
    // final MealController mealController = Get.find();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.bolt, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Quick Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24).copyWith(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Food',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 14),
                ),
                const SizedBox(height: 6),
                TextField(
                  onChanged: (value) => foodController.searchFood(value),
                  decoration: InputDecoration(
                    hintText: 'Search food (e.g., Chicken)',
                    hintStyle: const TextStyle(fontFamily: 'Montserrat'),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return foodController.filteredFoods.isEmpty
                      ? const Text("No results found.")
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: foodController.filteredFoods.length,
                          itemBuilder: (context, index) {
                            final item = foodController.filteredFoods[index];
                            return ListTile(
                              title: Text(item.name),
                              subtitle: Text(
                                  '${item.calories} kcal | ${item.protein}g protein'),
                              trailing: const Icon(Icons.add),
                              onTap: () {
                                _showQuantityDialog(
                                    context, item, foodController);
                              },
                            );
                          },
                        );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showQuantityDialog(
    BuildContext context,
    FoodItem item,
    FoodController controller,
  ) {
    final TextEditingController gramsController = TextEditingController();
    final MealController mealController =
        Get.find(); // ✅ Get MealController instance

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add ${item.name}"),
        content: TextField(
          controller: gramsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter quantity (in grams)',
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Add"),
            onPressed: () {
              final double? grams = double.tryParse(gramsController.text);
              if (grams != null && grams > 0) {
                // ✅ Add to daily summary
                controller.addToDailySummary(item, grams);

                // ✅ Calculate calories
                final double totalCalories = (item.calories / 100) * grams;

                // ✅ Add to meal controller for "Meals Today"
                mealController.addMealItem(
                  MealItem(
                    name: item.name,
                    calories: totalCalories,
                  ),
                );

                Navigator.pop(context);
                Get.snackbar(
                  "Food Added",
                  "${item.name} added to Meals Today",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor:
                      Colors.green.shade100, // light green background
                  colorText: Colors.green.shade900, // dark green text
                  icon: const Icon(Icons.check_circle, color: Colors.green),
                  margin: const EdgeInsets.all(10),
                  duration: const Duration(seconds: 2),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
