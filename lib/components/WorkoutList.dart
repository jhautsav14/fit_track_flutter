// import 'package:fit_track/controllers/WorkoutController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class WorkoutList extends StatelessWidget {
//   WorkoutList({super.key});

//   final WorkoutController workoutController = Get.find<WorkoutController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Workouts'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Obx(() {
//               final workouts = workoutController.workoutItems;
//               return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: workouts.length,
//                 itemBuilder: (context, index) {
//                   final workout = workouts[index];
//                   return ListTile(
//                     title: Text(workout.name),
//                     subtitle:
//                         Text('Calories per rep: ${workout.caloriesPerRep}'),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.add),
//                       onPressed: () {
//                         // Adding calories based on user input for reps
//                         workoutController.addToWorkoutSummary(
//                             workout, 10); // Example with 10 reps
//                       },
//                     ),
//                   );
//                 },
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
