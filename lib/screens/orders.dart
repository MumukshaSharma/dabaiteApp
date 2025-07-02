import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Your Orders", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 20),
          _buildOrderCard(
            context,
            image: "assets/images/nbc.jpg",
            name: "Nothing Before Coffee",
            location: "Jagatpura, Jaipur",
            items: ["1 x Oreo Shake"],
            total: "₹189.00",
            status: "Delivered",
            date: "29 Jun, 6:58PM",
          ),
          const SizedBox(height: 12),
          _buildOrderCard(
            context,
            image: "assets/images/kfc.jpg",
            name: "KFC",
            location: "Jagatpura, Jaipur",
            items: [
              "1 x Peri Peri 3 Pc Strips & Pepsi",
              "2 x Tandoori Flavour Dip - 20 gm",
              "1 x Medium Chicken Popcorn"
            ],
            total: "₹445.00",
            status: "Delivered",
            date: "29 Jun, 5:11PM",
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 30, 30, 30),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: "Search by restaurant or dish",
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context,
      {required String image,
      required String name,
      required String location,
      required List<String> items,
      required String total,
      required String status,
      required String date}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 30, 30, 30),
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
                  Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const Text("View menu", style: TextStyle(color: Colors.pinkAccent, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 10),
        ...items.map((item) => Text(item, style: const TextStyle(color: Colors.white))),
        const SizedBox(height: 8),
        Text("Order placed on $date", style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(status, style: const TextStyle(color: Colors.greenAccent, fontSize: 12)),
        const SizedBox(height: 8),
        Text(total, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Row(
          children: [
            Text("Rate", style: TextStyle(color: Colors.white)),
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