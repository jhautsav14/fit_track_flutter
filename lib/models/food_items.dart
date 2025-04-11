// class FoodItem {
//   final String name;
//   final double calories;
//   final double protein;
//   final double carbs;
//   final double fat;

//   FoodItem({
//     required this.name,
//     required this.calories,
//     required this.protein,
//     required this.carbs,
//     required this.fat,
//   });

//   factory FoodItem.fromCSV(String csvLine) {
//     final parts = csvLine.split(',');
//     return FoodItem(
//       name: parts[0],
//       calories: double.parse(parts[1]),
//       protein: double.parse(parts[2]),
//       carbs: double.parse(parts[3]),
//       fat: double.parse(parts[4]),
//     );
//   }
// }

class FoodItem {
  final String name;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;

  FoodItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}
