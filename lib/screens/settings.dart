import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  

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
        title: const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "v18.37.0(2)",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SettingTile(title: 'Edit Profile', subtitle: 'Change your name, description and profile photo'),
          SettingTile(title: 'Notification Settings', subtitle: 'Define what emails and notifications you want to see'),
          SettingTile(title: 'Account Settings', subtitle: 'Change your email or delete your account'),
          SettingTile(title: 'App Permissions', subtitle: 'Open your phone settings'),
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const SettingTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Color.fromARGB(255, 242, 236, 219))),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white54)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFFFF95F)),
      onTap: () {}, // Add navigation if needed
    );
  }
}