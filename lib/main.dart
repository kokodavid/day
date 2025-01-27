import 'dart:developer';

import 'package:day/helpers/utils/theme.dart';
import 'package:day/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  runApp(const ProviderScope(child:  MyApp()));
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
  Widget build(BuildContext context,WidgetRef ref) {
    final router = ref.read(appRouter);
    return MaterialApp.router(
      title: 'Day',
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      routerConfig: router,
    );
  }
}

