// keep your imports
import 'package:flutter/material.dart';
import 'package:dabaite/screens/index_screen.dart';
import 'package:dabaite/screens/account.dart';

const Color kelp = Color.fromARGB(255, 36, 41, 5);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  State<KitchenScreen> createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  bool isVeg = true;
  int _selectedIndex = 1; // Set default to Kitchens tab

  void _onItemTapped(int index) {
    if (index == 0) {
      // ✅ Navigate to IndexScreen using named route
      Navigator.pushReplacementNamed(context, '/index');
    } else {
      setState(() {
        _selectedIndex = index;
        // Navigation logic if needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: starkWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: kelp,
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.kitchen, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Kitchens",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AccountScreen(),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "710, Balaji Tower 5, Shri Kishanpura, Raj...",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 8),
                              Text(
                                "Search for Kitchen Name or Dish",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          const Text(
                            "VEG",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () => setState(() => isVeg = !isVeg),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 45,
                              height: 25,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: isVeg ? Colors.green : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white),
                              ),
                              child: AnimatedAlign(
                                duration: const Duration(milliseconds: 300),
                                alignment: isVeg
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: isVeg ? Colors.white : Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _OfferCard(
                        title: "Meals at ₹99",
                        icon: Icons.fastfood,
                        color: Colors.black,
                      ),
                      _OfferCard(
                        title: "Fast Food Delivery",
                        icon: Icons.bolt,
                        color: Colors.orange,
                      ),
                      _OfferCard(
                        title: "Flat ₹200 OFF",
                        icon: Icons.percent,
                        color: canary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Family Kitchens Near You",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kelp,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: const [
                  _HorizontalKitchenCard(
                    name: "Camp Katta Kitchen",
                    cuisine: "Maharashtrian, South Indian",
                    distance: "3 Kms",
                    rating: "5.0",
                  ),
                  _HorizontalKitchenCard(
                    name: "Shruti's Kitchen",
                    cuisine: "Maharashtrian, Punjabi",
                    distance: "3.3 Kms",
                    rating: "4.4",
                  ),
                  _HorizontalKitchenCard(
                    name: "Balaji Foods",
                    cuisine: "Punjabi, South Indian",
                    distance: "4 Kms",
                    rating: "4.0",
                  ),
                  _HorizontalKitchenCard(
                    name: "Meena Kitchen",
                    cuisine: "Maharashtrian, South Indian",
                    distance: "6.1 Kms",
                    rating: "4.5",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Explore Family Kitchens",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kelp,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: const [
                  _KitchenCard(
                    name: "Balaji Foods",
                    cuisine: "Maharashtrian, Punjabi, South Indian",
                    distance: "4 Kms",
                    rating: "4.0",
                  ),
                  _KitchenCard(
                    name: "Meena Kitchen",
                    cuisine: "Maharashtrian, South Indian",
                    distance: "6.1 Kms",
                    rating: "4.5",
                  ),
                  _KitchenCard(
                    name: "Mangy's Kitchen",
                    cuisine: "Bengali, South Indian",
                    distance: "6.7 Kms",
                    rating: "4.7",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 39, 44, 23),
        unselectedItemColor: const Color.fromARGB(255, 91, 102, 72),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'Plans'),
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), label: 'Kitchens'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _OfferCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _HorizontalKitchenCard extends StatelessWidget {
  final String name;
  final String cuisine;
  final String distance;
  final String rating;

  const _HorizontalKitchenCard({
    required this.name,
    required this.cuisine,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 160,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: kelp,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                cuisine,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.green),
                  Text(distance, style: const TextStyle(fontSize: 10)),
                  const SizedBox(width: 5),
                  const Icon(Icons.star, size: 14, color: Colors.orange),
                  Text(rating, style: const TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KitchenCard extends StatelessWidget {
  final String name;
  final String cuisine;
  final String distance;
  final String rating;

  const _KitchenCard({
    required this.name,
    required this.cuisine,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kelp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cuisine,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.green,
                      ),
                      Text(distance, style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 10),
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                      Text(rating, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
