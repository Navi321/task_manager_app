class Task {
  String title;
  String description;
  String category;
  DateTime date;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    this.isCompleted = false,
});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
      category: map['category'],
      date: DateTime.parse(map['date']),
      isCompleted: map['isCompleted'] == 1,
    );
  }
}