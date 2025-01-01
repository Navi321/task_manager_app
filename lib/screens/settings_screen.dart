import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedNotificationType = 'Audio and Push notifications';
  String _selectedTheme = 'System Default';
  String _selectedLanguage = 'English';

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

  final List<String> _languageOptions = [
    'English',
    'Russian',
    'Turkey',
    'Spanish',
    'French',
    'German',
  ];

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    setState(() {
      _selectedLanguage = _languageOptions.firstWhere(
          (language) => language.toLowerCase().startsWith(languageCode),
          orElse: () => 'English'
      );
    });
  }

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
            AppLocalizations.of(context).settings,
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
              AppLocalizations.of(context).notificationType,
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
              AppLocalizations.of(context).theme,
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
              ),
            ),
            SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).language,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                value: _selectedLanguage,
                items: _languageOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                    _changeLanguage(newValue);
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  offset: const Offset(0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(String language) {
    Locale newLocale;
    switch (language) {
      case 'Russian':
        newLocale = Locale('ru');
        break;
      case 'Turkey':
        newLocale = Locale('tr');
        break;
      case 'Spanish':
        newLocale = Locale('es');
        break;
      case 'French':
        newLocale = Locale('fr');
        break;
      case 'German':
        newLocale = Locale('de');
        break;
      default:
        newLocale = Locale('en');
    }
    Provider.of<LocaleProvider>(context, listen: false).setLocale(newLocale);
  }
}
