import 'package:day/features/habits/presentation/screens/home_screen.dart';
import 'package:day/features/habits/presentation/screens/on_board_screen.dart';
import 'package:day/features/habits/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouter = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/onBoard', builder: (context, state) => const OnBoardingScreen()),
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),

      ],
      errorBuilder: (context, state) => Scaffold(
            body: Center(
              child: Text('Error ${state.error}'),
            ),
          ));
});
