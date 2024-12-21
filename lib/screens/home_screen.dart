import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/card.dart';
import 'package:task_manager_app/widgets/menu_button.dart';
import 'package:task_manager_app/widgets/showtaskdetails.dart';
import 'package:task_manager_app/widgets/search_button.dart';
import 'package:task_manager_app/widgets/sort_button.dart';
import 'package:task_manager_app/screens/settings_screen.dart';
import 'package:task_manager_app/screens/new_task_screen.dart';
import 'package:task_manager_app/models/task.dart';

class HomeScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task(
      title: 'Task 1',
      description: 'I need to make a small background bar that will only be behind the text',
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
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Text(
            'My task',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchButton(
                      onSearch: (value) {
                        print('Search: $value');
                      },
                    ),
                    SortButton(
                      onSort: (value) {
                        print('Sort: $value');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
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
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 16,
            child: MenuButton(
              onSettingsPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              onAddTaskPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewTaskScreen(),
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}