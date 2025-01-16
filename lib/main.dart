import 'package:flutter/material.dart';
import 'package:my_tasks/config/theme/theme.dart';
import 'package:my_tasks/core/di/app_di.dart';
import 'package:my_tasks/features/list/presentation/pages/list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppDi.listProvider),
        ChangeNotifierProvider(create: (_) => AppDi.taskProvider)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MaterialTheme materialTheme = MaterialTheme(TextTheme());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Tasks',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: ListPage(),
    );
  }
}
