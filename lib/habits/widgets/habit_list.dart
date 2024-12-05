import 'package:flutter/material.dart';
import 'habit_card.dart';

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          HabitCard(
            title: 'Math Practice',
            days: 70,
            nextMilestone: 90,
            badges: ['badgeA','stage b', 'stage c'],
          ),
          SizedBox(height: 16),
          HabitCard(
            title: 'Quit Drinking Alcohol',
            days: 26,
            nextMilestone: 30,
            badges: ['stage b', 'stage c'],
          ),
          SizedBox(height: 16),
          HabitCard(
            title: 'Physics Practice',
            days: 26,
            nextMilestone: 30,
            badges: ['badgeA','stage c'],
          ),
        ],
      ),
    );
  }
}