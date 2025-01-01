import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_manager_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/providers/locale_provider.dart';
import 'screens/home_screen.dart';
import 'models/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'PlanIt',
            supportedLocales: const [
              Locale('en', ''),
              Locale('ru', ''),
              Locale('tr', ''),
              Locale('es', ''),
              Locale('fr', ''),
              Locale('de', ''),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: localeProvider.locale,
            theme: ThemeData(
              primarySwatch: Colors.cyan,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}