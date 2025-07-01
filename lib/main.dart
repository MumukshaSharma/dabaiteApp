import 'package:flutter/material.dart';
import 'screens/login.dart'; // Make sure this file exists

void main() {
  runApp(const DabiteApp());
}

class DabiteApp extends StatelessWidget {
  const DabiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dabite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: LoginScreen(), // ✅ Change this to your actual screen name
    );
  }
}