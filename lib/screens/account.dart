import 'package:flutter/material.dart';
import 'orders.dart';
import 'profile.dart';
import 'about.dart';
import 'feedback.dart';
import 'settings.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isVegMode = false;
  bool isPersonalized = false;

  @override
  Widget build(BuildContext context) {
    const Color kelp = Color.fromARGB(255, 36, 41, 5);
    const Color canary = Color(0xFFFFF95F);
    const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 228, 178),
      appBar: AppBar(
        backgroundColor: kelp,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
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
                color: kelp,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
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

            // Membership
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: kelp,
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
                            color: kelp,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Options
            _buildListItem(Icons.receipt_long, "My Orders", "3 active", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const OrdersScreen()));
            }),
            const SizedBox(height: 16),

            _buildListItem(Icons.card_giftcard, "Your Coupons", "4 new"),
            const SizedBox(height: 16),

            _buildListItem(Icons.system_update, "App Update Available", "v18.39.0",
                valueColor: const Color.fromARGB(255, 189, 49, 39)),
            const SizedBox(height: 16),

            _buildListItem(Icons.person, "Your Profile", "100% completed",
                valueColor: Colors.green, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
            }),
            const SizedBox(height: 16),

            _buildSwitchItem(Icons.eco, "Veg Mode", isVegMode, (val) {
              setState(() {
                isVegMode = val;
              });
            }),
            const SizedBox(height: 16),

            _buildSwitchItem(Icons.star, "Show Personalised Results", isPersonalized, (val) {
              setState(() {
                isPersonalized = val;
              });
            }),
            const SizedBox(height: 24),

            const Divider(height: 1, color: Color.fromARGB(118, 34, 33, 33)),
            const SizedBox(height: 24),

            _buildListItem(Icons.info_outline, "About", "",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()))),
            const SizedBox(height: 16),

            _buildListItem(Icons.feedback_outlined, "Send Feedback", "",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FeedbackScreen()))),
            const SizedBox(height: 16),

            _buildListItem(Icons.support_agent, "Help & Support", ""),
            const SizedBox(height: 16),

            _buildListItem(Icons.settings, "Settings", "",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()))),
            const SizedBox(height: 16),

            _buildListItem(Icons.logout, "Log out", "", valueColor: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
    IconData icon,
    String title,
    String value, {
    Color? valueColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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

  Widget _buildSwitchItem(
    IconData icon,
    String title,
    bool currentValue,
    ValueChanged<bool> onChanged,
  ) {
    return Row(
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
        Switch(
          value: currentValue,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}