import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color kelp = Color.fromARGB(255, 36, 41, 5);
    const Color canary = Color(0xFFFFF95F);
    const Color background = Color.fromARGB(255, 227, 228, 178);
    const Color cardBackground = Color.fromARGB(255, 242, 236, 219);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: kelp,
        title: const Text("Your Orders", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 20),

          // Order 1
          _buildOrderCard(
            image: "assets/images/tiffin1.jpg",
            name: "Home Delight Tiffin",
            location: "Malviya Nagar, Jaipur",
            items: [
              "1 x Roti Sabzi Dal Rice",
              "1 x Salad",
              "1 x Sweet (Gulab Jamun)"
            ],
            total: "₹99.00",
            status: "Delivered",
            date: "2 Jul, 1:02PM",
          ),
          const SizedBox(height: 12),

          // Order 2
          _buildOrderCard(
            image: "assets/images/tiffin2.jpg",
            name: "Maa Ke Haath Ka Khana",
            location: "Vaishali Nagar, Jaipur",
            items: [
              "1 x Aloo Matar",
              "2 x Roti",
              "1 x Rice & Dal"
            ],
            total: "₹85.00",
            status: "Delivered",
            date: "1 Jul, 8:11PM",
          ),
          const SizedBox(height: 12),

          // Order 3
          _buildOrderCard(
            image: "assets/images/tiffin3.jpg",
            name: "Dabite Special Thali",
            location: "Jagatpura, Jaipur",
            items: [
              "1 x Paneer Butter Masala",
              "3 x Butter Roti",
              "1 x Jeera Rice",
              "1 x Boondi Raita"
            ],
            total: "₹149.00",
            status: "Delivered",
            date: "30 Jun, 12:40PM",
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: const TextStyle(color: Color.fromARGB(255, 36, 41, 5)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 242, 236, 219),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: "Search by dish or vendor",
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildOrderCard({
    required String image,
    required String name,
    required String location,
    required List<String> items,
    required String total,
    required String status,
    required String date,
  }) {
    const Color kelp = Color.fromARGB(255, 36, 41, 5);
    const Color cardBackground = Color.fromARGB(255, 242, 236, 219);

    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(color: kelp, fontWeight: FontWeight.bold)),
                  Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const Text("View details", style: TextStyle(color: Colors.pinkAccent, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 10),
        ...items.map((item) => Text(item, style: const TextStyle(color: kelp))),
        const SizedBox(height: 8),
        Text("Order placed on $date", style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(status, style: const TextStyle(color: Colors.green, fontSize: 12)),
        const SizedBox(height: 8),
        Text(total, style: const TextStyle(color: kelp, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Row(
          children: [
            Text("Rate", style: TextStyle(color: kelp)),
            SizedBox(width: 8),
            Icon(Icons.star_border, color: Colors.grey),
            Icon(Icons.star_border, color: Colors.grey),
            Icon(Icons.star_border, color: Colors.grey),
            Icon(Icons.star_border, color: Colors.grey),
            Icon(Icons.star_border, color: Colors.grey),
          ],
        )
      ]),
    );
  }
}