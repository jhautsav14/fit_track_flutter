import 'package:fit_track/pages/activity_page.dart';
import 'package:fit_track/pages/home_screen.dart';
import 'package:fit_track/pages/homepage.dart';
import 'package:fit_track/pages/plans_page.dart';
import 'package:fit_track/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../controllers/nav_controller.dart';

class MainNavbar extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [
    Homepage(),
    ActivityPage(),
    HomeScreen(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[navController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navController.currentIndex.value,
            onTap: navController.changeTab,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.dumbbell),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.utensilsCrossed),
                label: 'Plans',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.settings2),
                label: 'Settings',
              ),
            ],
          ),
        ));
  }
}
