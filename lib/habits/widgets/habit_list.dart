import 'package:flutter/material.dart';
import 'habit_card.dart';

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          HabitCard(
            title: 'Quit Smoking Tobacco 🔥',
            days: 70,
            nextMilestone: 90,
          ),
          SizedBox(height: 16),
          HabitCard(
            title: 'Quit Drinking Alcohol 🔥',
            days: 26,
            nextMilestone: 30,
          ),
        ],
      ),
    );
  }
}