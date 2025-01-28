import 'dart:io';

import 'package:day/features/habits/data/models/habit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database? _database;

  static Future<Database> getDatabase() async {
    if(_database != null) return _database!;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'habits.db');
    _database = await openDatabase(path,version: 1,onCreate: (db, version)async{
      await db.execute("""
          CREATE TABLE habits (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            checkInFrequency TEXT,
            startDate TEXT,
            type TEXT
          )
        """);
    });
    return _database!;
  }

   static Future<void> insertHabit(Habit habit) async {
    final db = await getDatabase();
    await db.insert('habits', habit.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Habit>> getHabits() async{
    final db = await getDatabase();
    final List<Map<String,dynamic>> map = await db.query('habits');
    return List.generate(map.length, (i)=> Habit.fromMap(map[i]));
  }
}
