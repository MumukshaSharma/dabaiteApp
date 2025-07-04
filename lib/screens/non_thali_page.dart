import 'package:flutter/material.dart';

class NonThaliPage extends StatelessWidget {
  const NonThaliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Non-Veg Thali'),
        backgroundColor: Color.fromARGB(255, 36, 41, 5),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Details about the Non-Veg Thali',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}