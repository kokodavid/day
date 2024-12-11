import 'package:day/habits/widgets/add_habit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderProfile extends ConsumerWidget {
  const HeaderProfile({super.key});


  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person),
              ),
              const SizedBox(width: 12),
              Text(
                'Hi David',
                style: Theme.of(context).textTheme.bodySmall
              ),
            ],
          ),
          Container(
            decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                show(context);
              },
            ),
          ),
        ],
      ),
    );
  }
  void show(BuildContext context){
  showModalBottomSheet(context: context, builder: (BuildContext context){
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        children: [
          Text('Add Habit')
        ],
      ),
    );
  });
}
}


