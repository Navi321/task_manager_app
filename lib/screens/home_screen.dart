import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/card.dart';
import 'package:task_manager_app/widgets/menu_button.dart';
import 'package:task_manager_app/widgets/showtaskdetails.dart';
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
        title: Text(
          'My task',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                task: tasks[index],
                onOpenTask: () {
                  showTaskDetails(context, tasks[index]);
                },
              );
            },
          ),
          Positioned(
            bottom: 20,
            right: 1,
            child: MenuButton(
              onSettingsPressed: () {
                print('Settings pressed');
              },
              onAddTaskPressed: () {
                print('Add task pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}