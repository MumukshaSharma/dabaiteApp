import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

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
        title: const Text("Send Feedback", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Tell us what you love about the app, or what we could be doing better.",
              style: TextStyle(color: starkWhite, fontSize: 15),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 4,
              style: const TextStyle(color: starkWhite),
              decoration: InputDecoration(
                hintText: 'Enter feedback',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.star, color: canary),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Need help with your order?\n",
                            style: TextStyle(color: starkWhite, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Get instant help from our customer support team.\n",
                            style: TextStyle(color: Colors.white70),
                          ),
                          TextSpan(
                            text: "Go to order support",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: canary,
                foregroundColor: kelp,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Submit feedback"),
            )
          ],
        ),
      ),
    );
  }
}