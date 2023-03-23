import 'package:flutter/material.dart';
import 'package:optimizing_schedule/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
