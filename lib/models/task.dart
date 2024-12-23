import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String category;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
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

class TaskService {
  final Box<Task> _taskBox = Hive.box<Task>('tasks');

  List<Task> getAllTasks() {
    return _taskBox.values.toList();
  }

  void addTask(Task task) {
    _taskBox.add(task);
  }

  void updateTask(int index, Task task) {
    _taskBox.putAt(index, task);
  }

  void deleteTask(int index) {
    _taskBox.deleteAt(index);
  }
}