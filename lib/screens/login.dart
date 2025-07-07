import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:flutter/material.dart';
import './index_screen.dart';
import 'dart:async'; // NEW

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
 final _supabase = supabase.Supabase.instance.client; // Add this line
  StreamSubscription? _authSubscription;
   @override
  void initState() {
    super.initState();
    _handleDeepLink(); // Add this
  }
   Future<void> _handleDeepLink() async {
    // Check if user is already logged in
    final session = _supabase.auth.currentSession;
    if (session != null && mounted) {
      _navigateToHome();
      return;
    }
     _authSubscription = _supabase.auth.onAuthStateChange.listen((data) {
      if (data.event == supabase.AuthChangeEvent.signedIn && mounted) {
        _navigateToHome();
      }
    });
  }
    void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => IndexScreen()),
    );
  }
  @override
  void dispose() {
    emailController.dispose();
     _authSubscription?.cancel(); // Cancel the subscription
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF4),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/food_bg.png'),
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

            // Bottom Login UI
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "India’s #1 Home-style Meal Delivery App",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Log in or sign up",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email Address",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final email = emailController.text.trim();
                        if (email.isEmpty) return;

                        try {
                          await _supabase.auth.signInWithOtp(
        email: email,
        emailRedirectTo: 'io.supabase.flutter://login-callback/',
      );
                          _showMessage(
                            "📩 Check your email for the login link",
                          );
                        }  catch (e) {
      _showMessage("❌ Login failed: ${e.toString()}");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD300),
                        foregroundColor: const Color(0xFF355E3B),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 16),
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset(
                            'assets/icons/google.png',
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(Icons.email, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text.rich(
                      TextSpan(
                        text: 'By continuing, you agree to our ',
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ', '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ', and '),
                          TextSpan(
                            text: 'Content Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
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
