import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/card.dart';
import 'package:task_manager_app/widgets/menu_button.dart';
import 'package:task_manager_app/widgets/showtaskdetails.dart';
import 'package:task_manager_app/widgets/search_button.dart';
import 'package:task_manager_app/widgets/sort_button.dart';
import 'package:task_manager_app/screens/settings_screen.dart';
import 'package:task_manager_app/screens/new_task_screen.dart';
import 'package:task_manager_app/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskBox = Hive.box<Task>('tasks');

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
                        final filteredTasks = taskBox.values
                            .where((task) => task.title.contains(value) || task.description.contains(value))
                            .toList();
                      },
                    ),
                    SortButton(
                      onSort: (sortOption) {
                        List<Task> sortedTasks = taskBox.values.toList();
                        if (sortOption == 'Date') {
                          sortedTasks.sort((a, b) => a.date.compareTo(b.date));
                        } else if (sortOption == 'Category') {
                          sortedTasks.sort((a, b) => a.category.compareTo(b.category));
                        }
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: taskBox.listenable(),
                  builder: (context, Box<Task> box, _) {
                    if (box.isEmpty) {
                      return const Center(child: Text('No task available'));
                    }

                    return ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final task = box.getAt(index);
                        return TaskCard(
                          task: task!,
                          onOpenTask: () {
                            showTaskDetails(context, task);
                          },
                        );
                      }
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