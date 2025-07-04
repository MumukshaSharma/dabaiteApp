import 'package:flutter/material.dart';
import 'payMethod.dart';

const Color kelp = Color.fromARGB(255, 36, 41, 5);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

class CartTwo extends StatelessWidget {
  const CartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: starkWhite,
      appBar: AppBar(
        backgroundColor: kelp,
        title: const Text('CartTwo', style: TextStyle(color: canary)),
        iconTheme: const IconThemeData(color: canary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _billDetails(),
            const SizedBox(height: 20),
            _savingsBanner(),
            const SizedBox(height: 30),
            _addressButton(context),
            const SizedBox(height: 20),
            _paymentButton(context),
          ],
        ),
      ),
    );
  }

  Widget _billDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kelp.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text(
            'To Pay',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kelp,
            ),
          ),
          const Spacer(),
          const Text(
            '₹595.50',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '₹409.5',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kelp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _savingsBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: canary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Text("🎉", style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Congratulations! You Saved ₹186.00 on this order.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kelp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addressButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: kelp),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                // logic to select address
              },
              child: const Text(
                'SELECT ADDRESS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kelp,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kelp,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                // logic to add address
              },
              child: const Text(
                'ADD ADDRESS',
                style: TextStyle(
                  color: starkWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: canary,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PayMethodPage()),
        );
      },
      icon: const Icon(Icons.payment, color: kelp),
      label: const Text(
        "Add Payment Method",
        style: TextStyle(
          color: kelp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}