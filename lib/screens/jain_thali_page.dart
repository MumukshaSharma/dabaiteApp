import 'package:flutter/material.dart';

class JainThaliPage extends StatelessWidget {
  const JainThaliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jain Thali'),
        backgroundColor: Color.fromARGB(255, 36, 41, 5),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Details about the Jain Thali',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}