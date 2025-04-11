import 'dart:convert';
import 'package:fit_track/models/WorkoutItem.dart';
import 'package:flutter/services.dart';

class WorkoutController {
  List<WorkoutItem> workoutList = [];

  Future<void> loadWorkoutData() async {
    final String rawData =
        await rootBundle.loadString('assets/workout_data.csv');
    final List<List<dynamic>> csvData = const LineSplitter()
        .convert(rawData)
        .map((line) => line.split(','))
        .toList();

    workoutList = csvData
        .skip(1) // Skip header row
        .map((row) => WorkoutItem.fromCsv(row))
        .toList();
  }
}
