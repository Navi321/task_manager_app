import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My task'),

      ),
      body: ListView(
        children: [
          TaskCard(title: 'Task 1', description: 'Description 1', category: 'Category 1'),
          TaskCard(title: 'Task 2', description: 'Description 2', category: 'Category 2'),
        ],
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

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;

  const TaskCard({super.key, required this.title, required this.description, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 3,
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(category),
      ),
    );
  }
}