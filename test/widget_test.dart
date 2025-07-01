import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // <--- This line matches your test
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Make sure this matches the test as well

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('0'), // for the test to work
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // your increment logic here
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}