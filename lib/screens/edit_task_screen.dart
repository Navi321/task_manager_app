import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_manager_app/models/task.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../l10n/app_localizations.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  final int taskIndex;
  final VoidCallback onTaskUpdated;

  const EditTaskScreen({super.key, required this.task, required this.taskIndex, required this.onTaskUpdated});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _category;
  late DateTime _date;
  final List<String> _categories = ['Category 1', 'Category 2', 'Category 3'];

  @override
  void initState() {
    super.initState();
    _title = widget.task.title;
    _description = widget.task.description;
    _category = widget.task.category;
    _date = widget.task.date;

    // Ensure the initial category is in the list
    if (!_categories.contains(_category)) {
      _categories.add(_category);
    }
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final taskBox = Hive.box<Task>('tasks');
      final updatedTask = Task(
        title: _title,
        description: _description,
        category: _category,
        date: _date,
      );
      taskBox.putAt(widget.taskIndex, updatedTask);
      widget.onTaskUpdated();
      Navigator.pop(context);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  void _addCategory(String newCategory) {
    if (!_categories.contains(newCategory)) {
      setState(() {
        _categories.add(newCategory);
        _category = newCategory;
      });
    }
  }

  void _showAddCategoryDialog() {
    final _categoryController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              AppLocalizations.of(context).editTask,
          ),
          content: TextField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: 'Category Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_categoryController.text.isNotEmpty) {
                  _addCategory(_categoryController.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).editTask),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) => _title = value!,
                validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => _description = value!,
                validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Date'),
                controller: TextEditingController(text: _date.toLocal().toString().split(' ')[0]),
                onTap: () => _selectDate(context),
                validator: (value) => value!.isEmpty ? 'Please select a date' : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        value: _category,
                        items: _categories.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _category = newValue!;
                          });
                        },
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          offset: const Offset(0, 0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _showAddCategoryDialog,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTask,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}