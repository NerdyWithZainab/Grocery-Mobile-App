import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Grocery App",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
      ),
      themeMode: ThemeMode.system,
      home: GroceryApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(),
      home: const Grocery(title: "Grocery App"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Grocery extends StatefulWidget {
  const Grocery({super.key, required this.title});

  final String title;

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
