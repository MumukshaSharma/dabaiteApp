import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kelp = Color.fromARGB(255, 36, 41, 5);
    const Color canary = Color(0xFFFFF95F);
    const Color starkWhite = Color.fromARGB(255, 242, 236, 219);
    return Scaffold(
      backgroundColor: kelp,
      appBar: AppBar(
        backgroundColor: kelp,
        foregroundColor: starkWhite,
        title: const Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        children: const [
          AboutTile(title: 'Terms of Service'),
          AboutTile(title: 'Privacy Policy'),
          AboutTile(title: 'Open Source Libraries'),
          AboutTile(title: 'Licenses and Registrations'),
        ],
      ),
    );
  }
}

class AboutTile extends StatelessWidget {
  final String title;
  const AboutTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Color.fromARGB(255, 242, 236, 219), fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFFFF95F)),
      onTap: () {}, // Add navigation if needed
    );
  }
}