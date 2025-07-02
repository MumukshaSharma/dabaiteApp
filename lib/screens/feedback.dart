import 'package:flutter/material.dart';
import '/widgets/top_bar.dart';
import '/widgets/kitchens_section.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  bool isVeg = true;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color kelp = Color.fromARGB(255, 36, 41, 5);
    const Color canary = Color(0xFFFFF95F);
    const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 232, 199),
      appBar: AppBar(
        backgroundColor: kelp,
        title: const Text('Send Feedback', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We’d love to hear your thoughts!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kelp,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _feedbackController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Type your feedback here...',
                filled: true,
                fillColor: starkWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kelp,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  final feedback = _feedbackController.text.trim();
                  if (feedback.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Thank you for your feedback!')),
                    );
                    _feedbackController.clear();
                  }
                },
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}