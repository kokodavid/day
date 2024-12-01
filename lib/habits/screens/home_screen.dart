import 'package:flutter/material.dart';
import '../widgets/header_profile.dart';
import '../widgets/date_strip.dart';
import '../widgets/quote_card.dart';
import '../widgets/habit_list.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderProfile(),
            DateStrip(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QuoteCard(),
                    HabitList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}