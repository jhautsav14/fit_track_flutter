import 'package:fit_track/cards/daily_card.dart';
import 'package:fit_track/cards/meal_today.dart';
import 'package:fit_track/cards/quickadd_card.dart';
import 'package:fit_track/cards/workout_card.dart';
import 'package:fit_track/components/Bigtext.dart';
import 'package:fit_track/components/SmallText.dart';
import 'package:fit_track/components/inforow.dart';
import 'package:fit_track/components/resuable_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fit Track",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${DateFormat('EEEE, MMMM d').format(DateTime.now())} • Keep pushing!",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            DailySummaryCard(),
            SizedBox(
              height: 10,
            ),

            /// end

            MealsTodayCard(),
            SizedBox(
              height: 10,
            ),
            WorkoutCalorieTracker()
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(),
    );
  }
}
