import 'package:day/helpers/utils/theme.dart';
import 'package:day/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
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

