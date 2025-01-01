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
      'search': 'Search...',
      'add_task': 'Add Task',
      'task_title': 'Task Title',
      'task_description': 'Task Description',
      'category': 'Category',
      'date': 'Date',
      'edit_task': 'Edit Task',
      'edit': 'Edit',
      'delete_task': 'Delete Task',
      'settings': 'Settings',
      'notification_type': 'Notification Type',
      'theme': 'Theme',
      'language': 'Language',
    },
    'ru': {
      'title': 'Мои задачи',
      'search': 'Поиск...',
      'add_task': 'Добавить задачу',
      'task_title': 'Название задачи',
      'task_description': 'Описание задачи',
      'category': 'Категория',
      'date': 'Дата',
      'edit_task': 'Редактировать задачу',
      'edit': 'Редактировать',
      'delete_task': 'Удалить задачу',
      'settings': 'Настройки',
      'notification_type': 'Тип уведомления',
      'theme': 'Тема',
      'language': 'Язык',
    },
    'tr': {
      'title': 'Görevlerim',
      'search': 'Ara...',
      'add_task': 'Görev Ekle',
      'task_title': 'Görev Başlığı',
      'task_description': 'Görev Açıklaması',
      'category': 'Kategori',
      'date': 'Tarih',
      'edit_task': 'Görevi Düzenle',
      'edit': 'Düzenle',
      'delete_task': 'Görevi Sil',
      'settings': 'Ayarlar',
      'notification_type': 'Bildirim Türü',
      'theme': 'Tema',
      'language': 'Dil',
    },
    'es': {
      'title': 'Mis tareas',
      'search': 'Buscar...',
      'add_task': 'Agregar tarea',
      'task_title': 'Título de la tarea',
      'task_description': 'Descripción de la tarea',
      'category': 'Categoría',
      'date': 'Fecha',
      'edit_task': 'Editar tarea',
      'edit': 'Editar',
      'delete_task': 'Eliminar tarea',
      'settings': 'Ajustes',
      'notification_type': 'Tipo de notificación',
      'theme': 'Tema',
      'language': 'Idioma',
    },
    'fr': {
      'title': 'Mes tâches',
      'search': 'Rechercher...',
      'add_task': 'Ajouter une tâche',
      'task_title': 'Titre de la tâche',
      'task_description': 'Description de la tâche',
      'category': 'Catégorie',
      'date': 'Date',
      'edit_task': 'Modifier la tâche',
      'edit': 'Modifier',
      'delete_task': 'Supprimer la tâche',
      'settings': 'Paramètres',
      'notification_type': 'Type de notification',
      'theme': 'Thème',
      'language': 'Langue',
    },
    'de': {
      'title': 'Meine Aufgaben',
      'search': 'Suchen...',
      'add_task': 'Aufgabe hinzufügen',
      'task_title': 'Aufgabentitel',
      'task_description': 'Aufgabenbeschreibung',
      'category': 'Kategorie',
      'date': 'Datum',
      'edit_task': 'Aufgabe bearbeiten',
      'edit': 'Bearbeiten',
      'delete_task': 'Aufgabe löschen',
      'settings': 'Einstellungen',
      'notification_type': 'Benachrichtigungstyp',
      'theme': 'Thema',
      'language': 'Sprache',
    },
  };

  String get title => _localizedValues[locale.languageCode]!['title']!;
  String get search => _localizedValues[locale.languageCode]!['search']!;
  String get addTask => _localizedValues[locale.languageCode]!['add_task']!;
  String get taskTitle => _localizedValues[locale.languageCode]!['task_title']!;
  String get taskDescription => _localizedValues[locale.languageCode]!['task_description']!;
  String get category => _localizedValues[locale.languageCode]!['category']!;
  String get date => _localizedValues[locale.languageCode]!['date']!;
  String get editTask => _localizedValues[locale.languageCode]!['edit_task']!;
  String get edit => _localizedValues[locale.languageCode]!['edit']!;
  String get deleteTask => _localizedValues[locale.languageCode]!['delete_task']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get notificationType => _localizedValues[locale.languageCode]!['notification_type']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
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