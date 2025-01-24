import 'package:day/habits/notifiers/check_item_notifier.dart';
import 'package:day/helpers/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckItem extends ConsumerWidget {
  final String title;
  final StateNotifierProvider<StateNotifier<String?>, String?> provider;

  const CheckItem({super.key, required this.title, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTitle = ref.watch(provider);
    final isSelected = selectedTitle == title;

    return GestureDetector(
      onTap: () {
        final notifier = ref.read(provider.notifier);
        if (notifier is CheckInNotifier) {
          notifier.select(title);
        } else if (notifier is StartDateNotifier) {
          notifier.select(title);
        } else if (notifier is TypeNotifier) {
          notifier.select(title);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
            color: isSelected ? GlobalThemeData.primaryBlue : GlobalThemeData.lightGray,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
