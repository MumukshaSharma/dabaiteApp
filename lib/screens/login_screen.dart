import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Login to Dabite'),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
      ),
    );
  }
}
