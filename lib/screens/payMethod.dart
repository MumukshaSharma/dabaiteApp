import 'package:flutter/material.dart';

const Color kelp = Color.fromARGB(255, 36, 41, 5);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

class PayMethodPage extends StatelessWidget {
  const PayMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: starkWhite,
      appBar: AppBar(
        backgroundColor: kelp,
        title: const Text(
          'Select Payment Method',
          style: TextStyle(color: canary),
        ),
        iconTheme: const IconThemeData(color: canary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _paymentTile(
              icon: Icons.credit_card,
              title: "Credit/Debit Card",
              subtitle: "Pay using Visa, MasterCard, etc.",
              onTap: () {
                // Add card logic
              },
            ),
            const SizedBox(height: 12),
            _paymentTile(
              icon: Icons.account_balance_wallet,
              title: "UPI",
              subtitle: "Google Pay, PhonePe, etc.",
              onTap: () {
                // UPI logic
              },
            ),
            const SizedBox(height: 12),
            _paymentTile(
              icon: Icons.account_balance,
              title: "Net Banking",
              subtitle: "Select from popular banks",
              onTap: () {
                // Net banking logic
              },
            ),
            const SizedBox(height: 12),
            _paymentTile(
              icon: Icons.money,
              title: "Cash on Delivery",
              subtitle: "Pay with cash at delivery",
              onTap: () {
                // COD logic
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kelp.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: kelp),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: kelp,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: kelp.withOpacity(0.6),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: kelp),
          ],
        ),
      ),
    );
  }
}