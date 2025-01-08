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
      'date_asc': 'Date Ascending',
      'date_desc': 'Date Descending',
      'title_asc': 'Title Ascending',
      'title_desc': 'Title Descending',
      'add_task': 'Add Task',
      'task_title': 'Task Title',
      'task_description': 'Task Description',
      'category': 'Category',
      'create_category': 'Create category',
      'enter_category': 'Enter category name',
      'cancel': 'Cancel',
      'date': 'Date',
      'enter_title': 'Enter task title',
      'enter_description': 'Enter task description',
      'select_category': 'Select a category',
      'no_select_date': 'No date selected',
      'selected_date': 'Selected date:',
      'create_task': 'Create Task',
      'edit_task': 'Edit Task',
      'edit': 'Edit',
      'delete_task': 'Delete Task',
      'save': 'Save',
      'settings': 'Settings',
      'notification_type': 'Notification Type',
      'theme': 'Theme',
      'language': 'Language',
    },
    'ru': {
      'title': 'Мои задачи',
      'search': 'Поиск...',
      'date_asc': 'Дата (возрастание)',
      'date_desc': 'Дата (убывание)',
      'title_asc': 'Название (возрастание)',
      'title_desc': 'Название (убывание)',
      'add_task': 'Добавить задачу',
      'task_title': 'Название задачи',
      'task_description': 'Описание задачи',
      'category': 'Категория',
      'create_category': 'Создать категорию',
      'enter_category': 'Введите название категории',
      'cancel': 'Отмена',
      'date': 'Дата',
      'enter_title': 'Введите название задачи',
      'enter_description': 'Введите описание задачи',
      'select_category': 'Выберите категорию',
      'no_select_date': 'Дата не выбрана',
      'selected_date': 'Выбранная дата:',
      'create_task': 'Создать задачу',
      'edit_task': 'Редактировать задачу',
      'edit': 'Редактировать',
      'delete_task': 'Удалить задачу',
      'save': 'Сохранить',
      'settings': 'Настройки',
      'notification_type': 'Тип уведомления',
      'theme': 'Тема',
      'language': 'Язык',
    },
    'tr': {
      'title': 'Görevlerim',
      'search': 'Ara...',
      'date_asc': 'Tarihe Göre (Artan)',
      'date_desc': 'Tarihe Göre (Azalan)',
      'title_asc': 'Başlığa Göre (Artan)',
      'title_desc': 'Başlığa Göre (Azalan)',
      'add_task': 'Görev Ekle',
      'task_title': 'Görev Başlığı',
      'task_description': 'Görev Açıklaması',
      'category': 'Kategori',
      'create_category': 'Kategori oluştur',
      'enter_category': 'Kategori adını girin',
      'cancel': 'İptal',
      'date': 'Tarih',
      'enter_title': 'Görev başlığını girin',
      'enter_description': 'Görev açıklamasını girin',
      'select_category': 'Bir kategori seçin',
      'no_select_date': 'Tarih seçilmedi',
      'selected_date': 'Seçilen tarih:',
      'create_task': 'Görev Oluştur',
      'edit_task': 'Görevi Düzenle',
      'edit': 'Düzenle',
      'delete_task': 'Görevi Sil',
      'save': 'Kaydet',
      'settings': 'Ayarlar',
      'notification_type': 'Bildirim Türü',
      'theme': 'Tema',
      'language': 'Dil',
    },
    'es': {
      'title': 'Mis tareas',
      'search': 'Buscar...',
      'date_asc': 'Por fecha (ascendente)',
      'date_desc': 'Por fecha (descendente)',
      'title_asc': 'Por título (ascendente)',
      'title_desc': 'Por título (descendente)',
      'add_task': 'Agregar tarea',
      'task_title': 'Título de la tarea',
      'task_description': 'Descripción de la tarea',
      'category': 'Categoría',
      'create_category': 'Crear categoría',
      'enter_category': 'Introduzca el nombre de la categoría',
      'cancel': 'Cancelar',
      'date': 'Fecha',
      'enter_title': 'Introduzca el título de la tarea',
      'enter_description': 'Introduzca la descripción de la tarea',
      'select_category': 'Seleccionar una categoría',
      'no_select_date': 'Fecha no seleccionada',
      'selected_date': 'Fecha seleccionada:',
      'create_task': 'Crear tarea',
      'edit_task': 'Editar tarea',
      'edit': 'Editar',
      'delete_task': 'Eliminar tarea',
      'save': 'Guardar',
      'settings': 'Ajustes',
      'notification_type': 'Tipo de notificación',
      'theme': 'Tema',
      'language': 'Idioma',
    },
    'fr': {
      'title': 'Mes tâches',
      'search': 'Rechercher...',
      'date_asc': 'Par date (croissant)',
      'date_desc': 'Par date (décroissant)',
      'title_asc': 'Par titre (croissant)',
      'title_desc': 'Par titre (décroissant)',
      'add_task': 'Ajouter une tâche',
      'task_title': 'Titre de la tâche',
      'task_description': 'Description de la tâche',
      'category': 'Catégorie',
      'create_category': 'Créer une catégorie',
      'enter_category': 'Entrez le nom de la catégorie',
      'cancel': 'Annuler',
      'date': 'Date',
      'enter_title': 'Entrez le titre de la tâche',
      'enter_description': 'Entrez la description de la tâche',
      'select_category': 'Sélectionnez une catégorie',
      'no_select_date': 'Aucune date sélectionnée',
      'selected_date': 'Date sélectionnée:',
      'create_task': 'Créer une tâche',
      'edit_task': 'Modifier la tâche',
      'edit': 'Modifier',
      'delete_task': 'Supprimer la tâche',
      'save': 'Enregistrer',
      'settings': 'Paramètres',
      'notification_type': 'Type de notification',
      'theme': 'Thème',
      'language': 'Langue',
    },
    'de': {
      'title': 'Meine Aufgaben',
      'search': 'Suchen...',
      'date_asc': 'Nach Datum (aufsteigend)',
      'date_desc': 'Nach Datum (absteigend)',
      'title_asc': 'Nach Titel (aufsteigend)',
      'title_desc': 'Nach Titel (absteigend)',
      'add_task': 'Aufgabe hinzufügen',
      'task_title': 'Aufgabentitel',
      'task_description': 'Aufgabenbeschreibung',
      'category': 'Kategorie',
      'create_category': 'Kategorie erstellen',
      'enter_category': 'Geben Sie den Kategorienamen ein',
      'cancel': 'Abbrechen',
      'date': 'Datum',
      'enter_title': 'Geben Sie den Aufgabentitel ein',
      'enter_description': 'Geben Sie die Aufgabenbeschreibung ein',
      'select_category': 'Wählen Sie eine Kategorie',
      'no_select_date': 'Kein Datum ausgewählt',
      'selected_date': 'Ausgewähltes Datum:',
      'create_task': 'Aufgabe erstellen',
      'edit_task': 'Aufgabe bearbeiten',
      'edit': 'Bearbeiten',
      'delete_task': 'Aufgabe löschen',
      'save': 'Speichern',
      'settings': 'Einstellungen',
      'notification_type': 'Benachrichtigungstyp',
      'theme': 'Thema',
      'language': 'Sprache',
    },
  };

  String get title => _localizedValues[locale.languageCode]!['title']!;
  String get search => _localizedValues[locale.languageCode]!['search']!;
  String get dateAsc => _localizedValues[locale.languageCode]!['date_asc']!;
  String get dateDesc => _localizedValues[locale.languageCode]!['date_desc']!;
  String get titleAsc => _localizedValues[locale.languageCode]!['title_asc']!;
  String get titleDesc => _localizedValues[locale.languageCode]!['title_desc']!;
  String get addTask => _localizedValues[locale.languageCode]!['add_task']!;
  String get taskTitle => _localizedValues[locale.languageCode]!['task_title']!;
  String get taskDescription => _localizedValues[locale.languageCode]!['task_description']!;
  String get category => _localizedValues[locale.languageCode]!['category']!;
  String get createCategory => _localizedValues[locale.languageCode]!['create_category']!;
  String get enterCategory => _localizedValues[locale.languageCode]!['enter_category']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get date => _localizedValues[locale.languageCode]!['date']!;
  String get enterTitle => _localizedValues[locale.languageCode]!['enter_title']!;
  String get enterDescription => _localizedValues[locale.languageCode]!['enter_description']!;
  String get selectCategory => _localizedValues[locale.languageCode]!['select_category']!;
  String get noSelectDate => _localizedValues[locale.languageCode]!['no_select_date']!;
  String get selectedDate => _localizedValues[locale.languageCode]!['selected_date']!;
  String get createTask => _localizedValues[locale.languageCode]!['create_task']!;
  String get editTask => _localizedValues[locale.languageCode]!['edit_task']!;
  String get edit => _localizedValues[locale.languageCode]!['edit']!;
  String get deleteTask => _localizedValues[locale.languageCode]!['delete_task']!;
  String get save => _localizedValues[locale.languageCode]!['save']!;
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