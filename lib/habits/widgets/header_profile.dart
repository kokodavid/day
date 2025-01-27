import 'dart:developer';

import 'package:day/habits/notifiers/check_item_notifier.dart';
import 'package:day/habits/widgets/add_habit_screen.dart';
import 'package:day/habits/widgets/check_item.dart';
import 'package:day/habits/widgets/custom_button.dart';
import 'package:day/helpers/utils/theme.dart';
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
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person),
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
                show(context);
              },
            ),
          ),
        ],
      ),
    );
  }

void show(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the sheet to resize dynamically
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts for keyboard
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Makes modal height dynamic
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Add Habit',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Habit Name',
                    labelStyle: TextStyle(fontSize: 16),
                  ),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                Text("Check-in", style: GlobalThemeData.textTheme.bodySmall),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CheckItem(title: "Daily", provider: checkInProvider),
                    CheckItem(title: "Weekly", provider: checkInProvider),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Start Date", style: GlobalThemeData.textTheme.bodySmall),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CheckItem(title: "Today", provider: startDateProvider),
                    CheckItem(title: "Tomorrow", provider: startDateProvider),
                  ],
                ),
                const SizedBox(height: 16),
                Text("Type", style: GlobalThemeData.textTheme.bodySmall),
                Row(
                  children: [
                    CheckItem(title: "Build Habit", provider: typeProvider),
                    CheckItem(title: "Quit Habit", provider: typeProvider),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Add Habit",
                  backgroundColor: GlobalThemeData.primaryBlue,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  onPressed: () {
                    log("Habit Added!");
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

}
