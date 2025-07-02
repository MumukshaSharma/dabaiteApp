import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
                  backgroundColor: Colors.black,
                  child: Icon(Icons.edit, color: Colors.pinkAccent),
                )
              ],
            ),
            const SizedBox(height: 20),
            _buildField("Name", "Mumuksha Sharma"),
            _buildField("Mobile", "8696538315", showChange: true),
            _buildField("Email", "mumukshasharma504@gmail.com", showChange: true),
            _buildField("Date of birth", "12/04/2004"),
            _buildField("Anniversary", "", isDatePicker: true),
            _buildField("Gender", "Female"),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 42, 42, 42),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: const Text("Update profile"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String value, {bool showChange = false, bool isDatePicker = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          suffixIcon: showChange
              ? const TextButton(
                  onPressed: null,
                  child: Text("CHANGE", style: TextStyle(color: Colors.red)),
                )
              : (isDatePicker ? const Icon(Icons.calendar_today, color: Colors.grey) : null),
          hintText: value,
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: const Color.fromARGB(255, 36, 36, 36),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}