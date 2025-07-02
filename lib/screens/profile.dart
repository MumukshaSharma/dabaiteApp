import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kelp = Color.fromARGB(255, 29, 58, 10); // Green
    const Color canary = Color(0xFFFFF95F); // Yellow
    const Color starkWhite = Color.fromARGB(255, 242, 236, 219); // White
    const Color bgColor = Color.fromARGB(255, 227, 228, 178); // Background

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: kelp,
        title: const Text("Your Profile", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  child: const Icon(Icons.edit, color: Colors.pinkAccent, size: 20),
                )
              ],
            ),
            const SizedBox(height: 20),
            _buildField("Name", "Mumuksha Sharma", kelp),
            _buildField("Mobile", "8696538315", kelp, showChange: true),
            _buildField("Email", "mumukshasharma504@gmail.com", kelp, showChange: true),
            _buildField("Date of birth", "12/04/2004", kelp),
            _buildField("Anniversary", "", kelp, isDatePicker: true),
            _buildField("Gender", "Female", kelp),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kelp,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: const Text("Update profile", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String value, Color kelpColor,
      {bool showChange = false, bool isDatePicker = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: kelpColor),
          suffixIcon: showChange
              ? TextButton(
                  onPressed: () {},
                  child: const Text("CHANGE", style: TextStyle(color: Colors.red)),
                )
              : (isDatePicker
                  ? Icon(Icons.calendar_today, color: kelpColor)
                  : null),
          hintText: value,
          hintStyle: TextStyle(color: kelpColor, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: const Color.fromARGB(255, 242, 236, 219), // Field background
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
        style: TextStyle(color: kelpColor),
      ),
    );
  }
}