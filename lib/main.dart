import 'package:flutter/material.dart';
import 'package:my_tasks/config/theme.dart';
import 'package:my_tasks/providers/task_provider.dart';
import 'package:my_tasks/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MaterialTheme materialTheme = MaterialTheme(TextTheme());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: materialTheme.light(),
        darkTheme: materialTheme.dark(),
        themeMode: ThemeMode.system,
        home: HomeScreen(),
      ),
    );
  }
}
