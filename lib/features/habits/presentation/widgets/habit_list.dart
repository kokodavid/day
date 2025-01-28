import 'package:day/features/habits/presentation/providers/providers.dart';
import 'package:day/features/habits/presentation/widgets/habit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitList extends ConsumerWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsyncValue = ref.watch(habitsProvider);

    return habitsAsyncValue.when(
        data: (habits) => habits.isEmpty
            ? const Center(child: Text("No habits added yet."))
            : Expanded(
              child: ListView.builder(
                  itemCount: habits.length,
                  itemBuilder: (context, index) {
                    final habit = habits[index];
                    return HabitCard(title: habit.name, days: 10, nextMilestone: 90, badges: []);
                  },
                ),
            ),
        error: (error, stackTrace) => Center(child: Text("Error: $error")),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
