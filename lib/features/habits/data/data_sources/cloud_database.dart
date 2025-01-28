import 'package:day/features/habits/data/models/habit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<void> insertHabit(Habit habit,String userId)async{
    await supabase.from('habits').insert({
      'name': habit.name,
      'checkInFrequency': habit.checkInFrequency,
      'startDate': habit.startDate.toIso8601String(),
      'type': habit.type,
      'user_id': userId,
    });
  }

  Future<List<Habit>> getHabits(String userId) async {
    final data = await supabase.from('habits').select().eq('user_id',userId);
    return data.map((habit) => Habit.fromMap(habit)).toList();
  }
}