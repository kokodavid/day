import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckInNotifier extends StateNotifier<String?> {
  CheckInNotifier() : super(null);

  void select(String option) => state = (state == option) ? null : option;
}

final checkInProvider =
    StateNotifierProvider<CheckInNotifier, String?>((ref) {
  return CheckInNotifier();
});

class StartDateNotifier extends StateNotifier<String?> {
  StartDateNotifier() : super(null);
  void select(String option) => state = (state == option) ? null : option;
}

final startDateProvider =
    StateNotifierProvider<StartDateNotifier, String?>((ref) {
  return StartDateNotifier();
});

class TypeNotifier extends StateNotifier<String?> {
  TypeNotifier() : super(null);

  void select(String option) => state = (state == option) ? null : option;
}

final typeProvider = StateNotifierProvider<TypeNotifier, String?>((ref) {
  return TypeNotifier();
});
