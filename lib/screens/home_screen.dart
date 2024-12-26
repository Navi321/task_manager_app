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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<List<Task>> _sortedTasksNotifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    final taskBox = Hive.box<Task>('tasks');
    _sortedTasksNotifier.value = taskBox.values.toList();
  }

  void _sortTasks(String sortOption) {
    final taskBox = Hive.box<Task>('tasks');
    List<Task> sortedTasks = taskBox.values.toList();
    if (sortOption == 'Date Ascending') {
      sortedTasks.sort((a, b) => a.date.compareTo(b.date));
    } else if (sortOption == 'Date Descending') {
      sortedTasks.sort((a, b) => b.date.compareTo(a.date));
    } else if (sortOption == 'Title Ascending') {
      sortedTasks.sort((a, b) => a.title.compareTo(b.title));
    } else if (sortOption == 'Title Descending') {
      sortedTasks.sort((a, b) => b.title.compareTo(a.title));
    }
    _sortedTasksNotifier.value = sortedTasks;
  }

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
                        _sortedTasksNotifier.value = filteredTasks;
                      },
                    ),
                    SortButton(
                      onSort: _sortTasks,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<List<Task>>(
                  valueListenable: _sortedTasksNotifier,
                  builder: (context, sortedTasks, _) {
                    if (sortedTasks.isEmpty) {
                      return const Center(child: Text('No task available'));
                    }

                    return ListView.builder(
                        itemCount: sortedTasks.length,
                        itemBuilder: (context, index) {
                          final task = sortedTasks[index];
                          return TaskCard(
                            task: task,
                            onOpenTask: () {
                              showTaskDetails(context, task, index);
                            },
                            onDeleteTask: () {
                              taskBox.deleteAt(index);
                              _sortedTasksNotifier.value = taskBox.values.toList();
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