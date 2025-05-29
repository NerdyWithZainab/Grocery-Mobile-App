import 'package:flutter/material.dart';
import 'package:grocery_app/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute,
              (Route<dynamic> route) => false,
            );
          },
          child: const Text("Navigate to Register Screen"),
        ),
      ),
    );
  }
}
