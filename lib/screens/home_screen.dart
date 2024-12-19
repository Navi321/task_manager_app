import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/card.dart';
import 'package:task_manager_app/models/task.dart';

class HomeScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task(
      title: 'Task 1',
      description: 'Description 1',
      category: 'Category 1',
      date: DateTime.now(),
    ),
    Task(
      title: 'Task 2',
      description: 'Description 2',
      category: 'Category 2',
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My task'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard(
            task: tasks[index],
            onOpenTask: () {
              _showTaskDetails(context, tasks[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open the menu
        },
        child: Icon(Icons.menu),
      ),
    );
  }
}

void _showTaskDetails(BuildContext context, Task task) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
        task.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.description,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category: ${task.category}",
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                  Text(
                    "Date: ${_formatDate(task.date)}",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Edit the task
              Navigator.pop(context);
            },
            child: Text('Edit'),
          )
        ],
      );
    },
  );
}
String _formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
}


