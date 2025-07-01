import 'package:flutter/material.dart';
import 'screens/index_screen.dart';

void main() {
  runApp(DabiteApp());
}

class DabiteApp extends StatelessWidget {
  const DabiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dabite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: IndexScreen(),
    );
  }
}