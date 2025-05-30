import 'package:flutter/material.dart';
import 'package:grocery_app/login_screen.dart';

import 'package:grocery_app/navigation/navbar.dart';
import 'package:grocery_app/register_screen.dart';
import 'package:grocery_app/routes.dart';

import 'package:grocery_app/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      debugShowCheckedModeBanner: false,
      home: const Grocery(title: "Grocery App"),
      routes: {
        loginRoute: (context) => const LoginScreen(),
        registerRoute: (context) => const RegisterScreen(),
        homeRoute: (context) => const HomeScreen(),
      },
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
    return const Scaffold(
      body: Center(child: Text("Welcome to Grocery App")), // Add something here
      bottomNavigationBar: NavigationScreen(),
    );
  }
}
