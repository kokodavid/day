class Habit {
  int? id;
  String name;
  String checkInFrequency; 
  DateTime startDate;
  String type;

  Habit({
    this.id,
    required this.name,
    required this.checkInFrequency,
    required this.startDate,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'checkInFrequency': checkInFrequency,
      'startDate': startDate.toIso8601String(),
      'type': type,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'],
      name: map['name'],
      checkInFrequency: map['checkInFrequency'],
      startDate: DateTime.parse(map['startDate']),
      type: map['type'],
    );
  }
}
