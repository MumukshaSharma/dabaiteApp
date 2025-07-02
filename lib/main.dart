import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Test',
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Asset Test')),
        body: Center(
          child: Image.asset(
            'assets/images/food_bg.png', // Test this image path
            width: 200,
            height: 200,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error_outline, size: 40, color: Colors.red);
            },
          ),
        ),
      ),
    );
  }
}
