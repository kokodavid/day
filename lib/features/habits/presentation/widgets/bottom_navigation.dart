import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_4x4),
          label: 'Space',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.air),
          label: 'Breathing',
        ),
      ],
    );
  }
}