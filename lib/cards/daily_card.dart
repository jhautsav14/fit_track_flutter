// lib/widgets/daily_summary_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../controllers/daily_summary_controller.dart';

class DailySummaryCard extends StatelessWidget {
  DailySummaryCard({super.key});

  final DailySummaryController controller = Get.put(DailySummaryController());

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
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔷 Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(LucideIcons.activity, size: 20, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Daily Summary',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.5,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Your progress for today',
                    style: TextStyle(
                      color: Color(0xFFBFDBFE),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),

            // 🔷 Progress Content
            Padding(
              padding: const EdgeInsets.all(24).copyWith(top: 24),
              child: Column(
                children: [
                  Obx(() => _buildProgressItem(
                        context: context,
                        icon: Icons.local_fire_department,
                        iconColor: Colors.orange,
                        label: 'Calories',
                        value: controller.caloriesValue.value,
                        progress: controller.caloriesProgress.value,
                        goalKey: 'calories',
                      )),
                  const SizedBox(height: 16),
                  Obx(() => _buildProgressItem(
                        context: context,
                        icon: Icons.restaurant,
                        iconColor: Colors.green,
                        label: 'Protein',
                        value: controller.proteinValue.value,
                        progress: controller.proteinProgress.value,
                        goalKey: 'protein',
                      )),
                  const SizedBox(height: 16),
                  Obx(() => _buildProgressItem(
                        context: context,
                        icon: Icons.favorite,
                        iconColor: Colors.red,
                        label: 'Steps',
                        value: controller.stepsValue.value,
                        progress: controller.stepsProgress.value,
                        goalKey: 'steps',
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔧 Builds each progress item widget
  Widget _buildProgressItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required double progress,
    required String goalKey,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: iconColor),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => _showGoalDialog(context, label, goalKey),
                  icon: const Icon(Icons.edit, size: 18),
                  tooltip: 'Edit Goal',
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 2,
                  width: constraints.maxWidth * progress,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  /// 📝 Dialog to update goal
  void _showGoalDialog(BuildContext context, String title, String type) {
    final TextEditingController goalController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Set $title Goal'),
        content: TextField(
          controller: goalController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            hintText: 'Enter new goal',
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final value = double.tryParse(goalController.text);
              if (value != null && value > 0) {
                controller.setGoal(type: type.toLowerCase(), value: value);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
