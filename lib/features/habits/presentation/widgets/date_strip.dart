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
      height: 70,
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
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color:
                      isToday ? Theme.of(context).primaryColor : Colors.white,
                  width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('d').format(date),
                  style: TextStyle(
                    color:
                        isToday ? Theme.of(context).primaryColor : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('E').format(date).toUpperCase(),
                  style: TextStyle(
                    color:
                        isToday ? Theme.of(context).primaryColor : Colors.grey,
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
