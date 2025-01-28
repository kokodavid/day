
import 'dart:developer';

import 'package:day/features/habits/data/data_sources/local_database.dart';
import 'package:day/features/habits/data/models/habit.dart';
import 'package:day/features/habits/presentation/widgets/add_habit_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderProfile extends ConsumerWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: ()async{
                  List<Habit> results = await LocalDatabase.getHabits();
                  log("Habits ${results[0]}");
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person),
                ),
              ),
              const SizedBox(width: 12),
              Text('Hi David', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showHabitModal(context);
              },
            ),
          ),
        ],
      ),
    );
  }

void showHabitModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => HabitModalSheet(),
  );
}

}
