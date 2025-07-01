import 'package:flutter/material.dart';
import 'screens/index_screen.dart';

void main() {
  runApp(DabiteApp());
}

class DabiteApp extends StatelessWidget {
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