import 'package:flutter/material.dart';
import 'package:grocery_app/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              loginRoute,
              (Route<dynamic> route) => false,
            );
          },
          child: const Text("Navigate to Login Screen"),
        ),
      ),
    );
  }
}
