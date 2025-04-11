import 'package:fit_track/cards/quickadd_card.dart';
import 'package:fit_track/components/FoodListContainer.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plans Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              QuickAddCard(),
              SizedBox(
                height: 10,
              ),
              // FoodListContainer()
            ],
          ),
        ),
      ),
    );
  }
}
