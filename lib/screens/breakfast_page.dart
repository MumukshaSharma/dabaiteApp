import 'package:flutter/material.dart';

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breakfast'),
        backgroundColor: Color.fromARGB(255, 36, 41, 5),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Details about the Breakfast Plan',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}