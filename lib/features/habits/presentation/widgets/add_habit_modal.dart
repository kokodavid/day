import 'dart:developer';

import 'package:day/features/habits/data/data_sources/cloud_database.dart';
import 'package:day/features/habits/data/data_sources/local_database.dart';
import 'package:day/features/habits/data/data_sources/storage_preference.dart';
import 'package:day/features/habits/data/models/habit.dart';
import 'package:day/features/habits/presentation/providers/providers.dart';
import 'package:day/features/habits/presentation/widgets/check_item.dart';
import 'package:day/features/habits/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:day/core/themes/theme.dart';

class HabitModalSheet extends ConsumerStatefulWidget {
  const HabitModalSheet({super.key});

  @override
  _HabitModalSheetState createState() => _HabitModalSheetState();
}

class _HabitModalSheetState extends ConsumerState<HabitModalSheet> {
  final TextEditingController _habitNameController = TextEditingController();

  Future<void> _addHabit() async {
    final habitName = _habitNameController.text.trim();
    final checkIn = ref.read(checkInProvider);
    final startDate = ref.read(startDateProvider);
    final type = ref.read(typeProvider);
    final storageOption = await StoragePreference.getPrefrence();

    // Convert Start Date to DateTime
    DateTime startDay = DateTime.now();
    if (startDate == "Tomorrow") {
      startDay = DateTime.now().add(const Duration(days: 1));
    }

    if (habitName.isEmpty || checkIn == null || startDate == null || type == null) {
      log("❌ Please fill all fields before adding a habit");
      return;
    }

    Habit habit = Habit(
      name: habitName,
      checkInFrequency: checkIn,
      startDate: startDay,
      type: type,
    );

    log("✅ Habit Added: ${habit.toMap()}");

    // Store the habit based on user preference
    if (storageOption == 'local') {
      await LocalDatabase.insertHabit(habit);
    } else {
      // await SupabaseService().insertHabit(habit, userId);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Add Habit',
                  style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _habitNameController,
                decoration: const InputDecoration(
                  labelText: 'Habit Name',
                  labelStyle: TextStyle(fontSize: 16),
                ),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              _buildCheckItems("Check-in", ["Daily", "Weekly"], checkInProvider),
              _buildCheckItems("Start Date", ["Today", "Tomorrow"], startDateProvider),
              _buildCheckItems("Type", ["Build Habit", "Quit Habit"], typeProvider),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Add Habit',
                onPressed: _addHabit,
                backgroundColor: GlobalThemeData.primaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckItems(
      String title, List<String> options, StateNotifierProvider<StateNotifier<String?>, String?> provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: options.map((option) => CheckItem(title: option, provider: provider)).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
