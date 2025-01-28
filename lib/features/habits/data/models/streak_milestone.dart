class StreakMilestone {
  final String id;
  final String name;
  final String description;
  final int requiredStreakDays;

  StreakMilestone(
      {required this.id,
      required this.name,
      required this.description,
      required this.requiredStreakDays});

}

final List<StreakMilestone> streakMilestones = [
  StreakMilestone(id: 'streak_3', name: 'First Streak', description: 'Maintain a habit for 3 days!', requiredStreakDays: 3),
  StreakMilestone(id: 'streak_7', name: 'One Week Strong', description: 'Keep your habit going for 7 days!', requiredStreakDays: 7),
  StreakMilestone(id: 'streak_14', name: 'Two-Week Warrior', description: 'Maintain a 14-day streak!', requiredStreakDays: 14),
  StreakMilestone(id: 'streak_21', name: 'Three-Week Streak', description: 'Reach 21 days without breaking!', requiredStreakDays: 21),
  StreakMilestone(id: 'streak_30', name: 'One Month Master', description: 'Stay consistent for 30 days!', requiredStreakDays: 30),
  StreakMilestone(id: 'streak_45', name: '45-Day Beast Mode', description: 'Keep your habit for 45 days!', requiredStreakDays: 45),
  StreakMilestone(id: 'streak_60', name: '60-Day Unstoppable', description: 'Maintain a 60-day streak!', requiredStreakDays: 60),
  StreakMilestone(id: 'streak_100', name: '100-Day Legend', description: 'Reach a 100-day streak!', requiredStreakDays: 100),
];