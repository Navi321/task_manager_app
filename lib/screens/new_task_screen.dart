import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_manager_app/models/task.dart';

import '../l10n/app_localizations.dart';

class NewTaskScreen extends StatefulWidget {
  final VoidCallback onTaskAdded;
  const NewTaskScreen({super.key, required this.onTaskAdded});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  String? _selectedCategory;
  DateTime? _selectedDate;

  final List<String> _categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Create New',
  ];

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Text(
            AppLocalizations.of(context).addTask,
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Task Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _taskTitleController,
                decoration: const InputDecoration(
                  hintText: 'Enter task title',
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Task Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _taskDescriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter task description',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              const Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                isExpanded: true,
                hint: const Text('Select a category'),
                value: _selectedCategory,
                items: _categories
                    .map((String category) => DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                ))
                    .toList(),
                onChanged: (String? value) {
                  if (value == 'Create New') {
                    _showCreateCategoryDialog();
                  } else {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }
                },
                dropdownStyleData: DropdownStyleData(
                  offset: const Offset(0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate != null
                          ? 'Selected date: ${_selectedDate!.toLocal()}'.split(' ')[0]
                          : 'No date selected',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.cyan,),
                    onPressed: _pickDate,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _createTask,
                child: const Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showCreateCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create new category'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Enter category name'),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _categories.insert(_categories.length - 1, value);
                  _selectedCategory = value;
                });
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _createTask() {
    if (_taskTitleController.text.isEmpty ||
        _taskDescriptionController.text.isEmpty ||
        _selectedCategory == null ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all field')),
      );
      return;
    }

    final task = Task(
      title: _taskTitleController.text,
      description: _taskDescriptionController.text,
      category: _selectedCategory!,
      date: _selectedDate!,
    );

    final taskBox = Hive.box<Task>('tasks');
    taskBox.add(task);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task created successfully')),
    );

    widget.onTaskAdded();
    Navigator.pop(context);
  }
}