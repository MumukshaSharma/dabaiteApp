import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Theme Colors
    const Color kelp = Color.fromARGB(255, 29, 58, 10); // Green
    const Color canary = Color(0xFFFFF95F); // Yellow
    const Color starkWhite = Color.fromARGB(255, 242, 236, 219); // White

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 228, 178),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 41, 5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // ✅ Goes back to home page
          },
        ),
        title: const Text('Account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 41, 5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mumuksha",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("mumukshasharma504@gmail.com",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Gold Membership
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 41, 5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.verified, color: Colors.white),
                      SizedBox(width: 10),
                      Text("dabite Member",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: canary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Saved ₹717",
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 41, 5),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // My Orders - added above Your Coupons
            _buildListItem(Icons.receipt_long, "My Orders", "3 active"),

            // Coupons & Options
            _buildListItem(Icons.card_giftcard, "Your Coupons", "4 new"),
            _buildListItem(Icons.system_update, "App Update Available", "v18.39.0",
                valueColor: const Color.fromARGB(255, 189, 49, 39)),
            _buildListItem(Icons.person, "Your Profile", "100% completed", valueColor: Colors.green),
            _buildListItem(Icons.eco, "Veg Mode", "OFF", valueColor: const Color.fromARGB(255, 39, 39, 39)),
            _buildListItem(Icons.star, "Show Personalised Results", "OFF",
                valueColor: const Color.fromARGB(255, 189, 49, 39)),

            const Divider(height: 40, color: Color.fromARGB(118, 34, 33, 33)),

            // More Options (updated Help & Support)
            _buildListItem(Icons.info_outline, "About", ""),
            _buildListItem(Icons.feedback_outlined, "Send Feedback", ""),
            _buildListItem(Icons.support_agent, "Help & Support", ""),
            _buildListItem(Icons.settings, "Settings", ""),
            _buildListItem(Icons.logout, "Log out", "", valueColor: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color.fromARGB(255, 36, 41, 5)),
              const SizedBox(width: 12),
              Text(title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 36, 41, 5), fontSize: 16)),
            ],
          ),
          if (value.isNotEmpty)
            Text(value,
                style: TextStyle(
                    color: valueColor ?? Colors.grey,
                    fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}