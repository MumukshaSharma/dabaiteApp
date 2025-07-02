import 'package:flutter/material.dart';
import 'screens/index_screen.dart';
import 'screens/student_plan_page.dart'; // required for routing

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
      home: IndexScreen(),
      routes: {
        '/student-plan': (context) => StudentPlanPage(),
      },
    );
  }
}