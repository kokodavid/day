import 'package:day/features/habits/data/data_sources/local_database.dart';
import 'package:day/features/habits/data/models/habit.dart';
import 'package:day/features/habits/presentation/state/notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final habitsProvider = FutureProvider<List<Habit>>((ref) async {
  return LocalDatabase.getHabits();
});

final typeProvider = StateNotifierProvider<TypeNotifier, String?>((ref) {
  return TypeNotifier();
});

final checkInProvider =
    StateNotifierProvider<CheckInNotifier, String?>((ref) {
  return CheckInNotifier();
});

final startDateProvider =
    StateNotifierProvider<StartDateNotifier, String?>((ref) {
  return StartDateNotifier();
});
