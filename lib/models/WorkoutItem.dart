class WorkoutItem {
  final String name;
  final double caloriesPerRep;

  WorkoutItem({required this.name, required this.caloriesPerRep});

  factory WorkoutItem.fromCsv(List<dynamic> row) {
    return WorkoutItem(
      name: row[0],
      caloriesPerRep: double.tryParse(row[1].toString()) ?? 0,
    );
  }
}
