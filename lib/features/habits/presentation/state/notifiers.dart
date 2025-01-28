import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckInNotifier extends StateNotifier<String?> {
  CheckInNotifier() : super(null);

  void select(String option) => state = (state == option) ? null : option;
}

class StartDateNotifier extends StateNotifier<String?> {
  StartDateNotifier() : super(null);
  void select(String option) => state = (state == option) ? null : option;
}

class TypeNotifier extends StateNotifier<String?> {
  TypeNotifier() : super(null);

  void select(String option) => state = (state == option) ? null : option;
}
