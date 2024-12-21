import 'package:day/helpers/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitDetailScreen extends StatelessWidget {
  final String title;
  final int days;
  final int nextMilestone;

  const HabitDetailScreen({
    super.key,
    required this.title,
    required this.days,
    required this.nextMilestone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalThemeData.backgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          style: GlobalThemeData.textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // TODO: Implement delete functionality
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProgressCard(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check-in',
                style: GlobalThemeData.textTheme.bodySmall,
              ),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your check-in is up to date',
                        style: GlobalThemeData.textTheme.bodySmall),
                    Text('30 min ago',
                        style: GlobalThemeData.textTheme.bodySmall),
                  ],
                ),
                const Icon(Icons.check)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upcoming Milestones',
                  style: GlobalThemeData.textTheme.bodySmall),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ),
          _buildMilestoneCard(),
          const SizedBox(height: 16),
          _buildStreakCalendar(),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: GlobalThemeData.linearGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        days.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Days',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Next milestone is $nextMilestone days.',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Row(
                      //   children: badges.map((badge) {
                      //     return Padding(
                      //       padding: const EdgeInsets.only(right: 8.0),
                      //       child: SvgPicture.asset(
                      //         'assets/$badge.svg',
                      //         height: 32,
                      //         width: 32,
                      //       ),
                      //     );
                      //   }).toList(),
                      // )
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneCard() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/stage c.svg',
                  height: 32,
                  width: 32,
                ),
                Text('3 Months', style: GlobalThemeData.textTheme.bodySmall),
              ],
            ),
            Text(
              'You will achieve this milestone in 21 days',
              style: GlobalThemeData.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              '$nextMilestone days',
              style: GlobalThemeData.textTheme.bodySmall,
            ),
            LinearProgressIndicator(
              value: days / nextMilestone,
              backgroundColor: Colors.grey[200],
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakCalendar() {
    List<DateTime> dates = [];
    return TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: GlobalThemeData.primaryPurple,
            size: 25,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: GlobalThemeData.primaryPurple,
            size: 25,
          ),
        ),
        availableGestures: AvailableGestures.horizontalSwipe,
        calendarStyle: const CalendarStyle(
            isTodayHighlighted: false,
            // Customize the appearance here
            defaultTextStyle: TextStyle(
              color: Colors.black,
            ),
            todayDecoration: BoxDecoration(
                color: Colors.greenAccent, shape: BoxShape.circle)),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            for (DateTime d in dates) {
              if (day.day == d.day &&
                  day.month == d.month &&
                  day.year == d.year) {
                return Transform.scale(
                  scale: 0.8,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.greenAccent, shape: BoxShape.circle),
                    child: const Center(
                      child: Text(
                        '🔥',
                      ),
                    ),
                  ),
                );
              }
            }
            return null;
          },
        ));
  }
}
