import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedNotificationType = 'Audio and Push notifications';
  String _selectedTheme = 'System Default';

  final List<String> _notificationOptions = [
    'Audio and Push notifications',
    'Push notifications',
    'No notifications',
  ];

  final List<String> _themeOptions = [
    'Light',
    'Dark',
    'System Default',
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
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification Type',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                value: _selectedNotificationType,
                items: _notificationOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedNotificationType = newValue!;
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  offset: const Offset(0, 0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'App Theme',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                value: _selectedTheme,
                items: _themeOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTheme = newValue!;
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  offset: const Offset(0, 0),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

// Все починилось, только при открытии списка он открывается от параметра в списке, то есть если выбран последний параметр то список открывается