import 'package:flutter/material.dart';
import 'package:my_tasks/config/theme.dart';
import 'package:my_tasks/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MaterialTheme materialTheme = MaterialTheme(TextTheme());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: materialTheme.light(), // Set the light theme
      darkTheme: materialTheme.dark(), // Set the dark theme
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
