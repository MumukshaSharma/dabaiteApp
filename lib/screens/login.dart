import 'package:flutter/material.dart';
import './index_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF4), // Light background
      body: SafeArea(
        child: Column(
          children: [
            // Top section with food background
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/food_bg.png'), // Your image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'dabite',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom login UI
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "India’s #1 Home-style Meal Delivery App",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const Text("Log in or sign up", textAlign: TextAlign.center),
                    const SizedBox(height: 16),

                    // Phone input
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text("+91 🇮🇳"),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Enter Phone Number",
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Continue button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => IndexScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD300), // Canary Yellow
                        foregroundColor: const Color(0xFF355E3B), // Kelp Green text
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Continue", style: TextStyle(fontSize: 16)),
                    ),

                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("or"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Social buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/icons/google.png', height: 24),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(Icons.email, color: Colors.black),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Terms
                    const Text.rich(
                      TextSpan(
                        text: 'By continuing, you agree to our ',
                        children: [
                          TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(decoration: TextDecoration.underline)),
                          TextSpan(text: ', '),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(decoration: TextDecoration.underline)),
                          TextSpan(text: ', and '),
                          TextSpan(
                              text: 'Content Policy',
                              style: TextStyle(decoration: TextDecoration.underline)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}