import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task.dart';
import 'package:hive/hive.dart';

import '../screens/edit_task_screen.dart';

void showTaskDetails(BuildContext context, Task task, int taskIndex, VoidCallback onTaskDeleted) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: AnimationController(
            duration: const Duration(milliseconds: 300),
            vsync: Navigator.of(context),
          )..forward(),
          curve: Curves.easeInOut,
        ),
        child: AlertDialog(
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
                      task.category,
                      style: TextStyle(fontSize: 14, color: Colors.cyan),
                    ),
                    Text(
                      _formatDate(task.date),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskScreen(
                      task: task,
                      taskIndex: taskIndex,
                      onTaskUpdated: onTaskDeleted,
                    ),
                  ),
                );
              },
              child: Text('Edit', style: TextStyle(color: Colors.cyan)),
             // style: ButtonStyle(
             //   backgroundColor: WidgetStateProperty.all(Colors.cyan),
             // ),
            ),
            ElevatedButton(
              onPressed: () {
                final taskBox = Hive.box<Task>('tasks');
                if (taskIndex < taskBox.length) {
                  taskBox.deleteAt(taskIndex);
                  onTaskDeleted();
                }
                Navigator.pop(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            )
          ],
        ),
      );
    },
  );
}

String _formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}