import 'dart:developer';

import 'package:day/core/themes/theme.dart';
import 'package:day/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.get('SUPABASE_URL'), anonKey: dotenv.get('SUPABASE_ANON_KEY'));
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initSharedPreferences() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    log("✅ SharedPreferences initialized successfully.");
  } catch (e) {
    log("❌ SharedPreferences initialization error: $e");
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(appRouter);
    return MaterialApp.router(
      title: 'Day',
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      routerConfig: router,
    );
  }
}
