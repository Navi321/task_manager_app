import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'My task',
      'add_task': 'Add Task',
      'edit_task': 'Edit Task',
      'edit': 'Edit',
      'delete_task': 'Delete Task',
      'settings': 'Settings',
    },
    'ru': {
      'title': 'Мои задачи',
      'add_task': 'Добавить задачу',
      'edit_task': 'Редактировать задачу',
      'edit': 'Редактировать',
      'delete_task': 'Удалить задачу',
      'settings': 'Настройки',
    },
    'tr': {
      'title': 'Görevlerim',
      'add_task': 'Görev Ekle',
      'edit_task': 'Görevi Düzenle',
      'edit': 'Düzenle',
      'delete_task': 'Görevi Sil',
      'settings': 'Ayarlar',
    },
    'es': {
      'title': 'Mis tareas',
      'add_task': 'Agregar tarea',
      'edit_task': 'Editar tarea',
      'edit': 'Editar',
      'delete_task': 'Eliminar tarea',
      'settings': 'Ajustes',
    },
    'fr': {
      'title': 'Mes tâches',
      'add_task': 'Ajouter une tâche',
      'edit_task': 'Modifier la tâche',
      'edit': 'Modifier',
      'delete_task': 'Supprimer la tâche',
      'settings': 'Paramètres',
    },
    'de': {
      'title': 'Meine Aufgaben',
      'add_task': 'Aufgabe hinzufügen',
      'edit_task': 'Aufgabe bearbeiten',
      'edit': 'Bearbeiten',
      'delete_task': 'Aufgabe löschen',
      'settings': 'Einstellungen',
    },
  };

  String get title => _localizedValues[locale.languageCode]!['title']!;
  String get addTask => _localizedValues[locale.languageCode]!['add_task']!;
  String get editTask => _localizedValues[locale.languageCode]!['edit_task']!;
  String get edit => _localizedValues[locale.languageCode]!['edit']!;
  String get deleteTask => _localizedValues[locale.languageCode]!['delete_task']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'tr', 'es', 'fr', 'de'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}