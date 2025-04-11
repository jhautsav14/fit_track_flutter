// import 'package:fit_track/models/food_items.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/food_controller.dart';

// class FoodListContainer extends StatelessWidget {
//   const FoodListContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final FoodController controller = Get.find<FoodController>();

//     return Obx(() {
//       if (controller.foods.isEmpty) {
//         return const Center(child: CircularProgressIndicator());
//       }

//       return Container(
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Theme.of(context).cardColor,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: controller.foods.length,
//           itemBuilder: (context, index) {
//             final FoodItem item = controller.foods[index];
//             return ListTile(
//               title: Text(item.name),
//               subtitle: Text(
//                 'Calories: ${item.calories.toStringAsFixed(0)} kcal • Protein: ${item.protein.toStringAsFixed(1)}g',
//                 style: const TextStyle(fontSize: 12),
//               ),
//               trailing: IconButton(
//                 icon: const Icon(Icons.add),
//                 onPressed: () {
//                   controller.addToDailySummary(item);
//                   Get.snackbar(
//                     "Added",
//                     "${item.name} added to your daily summary",
//                     snackPosition: SnackPosition.BOTTOM,
//                     duration: const Duration(seconds: 2),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       );
//     });
//   }
// }
