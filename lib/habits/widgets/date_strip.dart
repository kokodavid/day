import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateStrip extends StatelessWidget {
  const DateStrip({super.key});

  List<DateTime> _getDates() {
    final now = DateTime.now();
    return List.generate(7, (index) {
      return now.add(Duration(days: index - 3));
    });
  }

  @override
  Widget build(BuildContext context) {
    final dates = _getDates();
    
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isToday = DateFormat('d').format(DateTime.now()) == 
                         DateFormat('d').format(date);
          
          return Container(
            width: 45,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isToday ? Colors.deepPurple : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('d').format(date),
                  style: TextStyle(
                    color: isToday ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('E').format(date).toUpperCase(),
                  style: TextStyle(
                    color: isToday ? Colors.white : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}