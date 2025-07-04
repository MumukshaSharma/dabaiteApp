// special_thali_page.dart
import 'package:flutter/material.dart';

class SpecialThaliPage extends StatelessWidget {
  const SpecialThaliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Special Thali')),
      body: const Center(child: Text('Details about Special Thali')),
    );
  }
}