import 'package:fit_track/controllers/WorkoutController.dart';
import 'package:fit_track/models/WorkoutItem.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WorkoutCalorieTracker extends StatefulWidget {
  const WorkoutCalorieTracker({super.key});

  @override
  State<WorkoutCalorieTracker> createState() => _WorkoutCalorieTrackerState();
}

class _WorkoutCalorieTrackerState extends State<WorkoutCalorieTracker> {
  final WorkoutController _controller = WorkoutController();
  List<WorkoutItem> _workoutList = [];
  WorkoutItem? _selectedWorkout;
  int _sets = 1;
  int _reps = 1;
  double _caloriesBurned = 0;

  @override
  void initState() {
    super.initState();
    _loadWorkoutData();
  }

  Future<void> _loadWorkoutData() async {
    await _controller.loadWorkoutData();
    setState(() {
      _workoutList = _controller.workoutList;
    });
  }

  void _calculateCalories() {
    if (_selectedWorkout == null) return;

    double total = _sets * _reps * _selectedWorkout!.caloriesPerRep;
    setState(() {
      _caloriesBurned = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with gradient and calories burned
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF59E0B), Color(0xFFFFED29)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(LucideIcons.dumbbell, size: 20, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        'Workout Calorie Tracker',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '🔥 Calories Burned: ${_caloriesBurned.toStringAsFixed(2)} kcal',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Content area
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Select Workout:',
                    style: TextStyle(fontSize: 14, fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<WorkoutItem>(
                    items: _workoutList.map((workout) {
                      return DropdownMenuItem(
                        value: workout,
                        child: Text(workout.name),
                      );
                    }).toList(),
                    onChanged: (WorkoutItem? value) {
                      setState(() {
                        _selectedWorkout = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildNumberField(
                          label: 'Sets:',
                          initialValue: _sets.toString(),
                          onChanged: (val) {
                            setState(() => _sets = int.tryParse(val) ?? 1);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildNumberField(
                          label: 'Reps/Minutes:',
                          initialValue: _reps.toString(),
                          onChanged: (val) {
                            setState(() => _reps = int.tryParse(val) ?? 1);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _calculateCalories,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Calculate Calories Burned',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Return to Main Menu',
                      style: TextStyle(color: Color(0xFF3B82F6)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontFamily: 'Montserrat'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
