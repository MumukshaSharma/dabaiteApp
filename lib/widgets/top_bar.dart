import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/account.dart';

class TopBar extends StatefulWidget {
  final bool isVeg;
  final Function(bool) setIsVeg;

  const TopBar({required this.isVeg, required this.setIsVeg, super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<String> images = [
    'assets/images/2.jpg',
    'assets/images/tab3.jpg',
  ];

  final List<Map<String, String>> todaysMenu = [
    {'name': 'Rajma Chawal', 'image': 'assets/images/rajma.jpg'},
    {'name': 'Kadhi Chawal', 'image': 'assets/images/kadhi.jpeg'},
    {'name': 'Khichdi', 'image': 'assets/images/khichdi.webp'},
    {'name': 'Poha', 'image': 'assets/images/poha.jpg'},
    {'name': 'Idli', 'image': 'assets/images/idli.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _showFullMenuSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFFFFDF5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Today's Full Menu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todaysMenu.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = todaysMenu[index];
                  return Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(item['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['name']!,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(
            child: Divider(color: Colors.grey, thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 36, 41, 5),
                letterSpacing: 1,
              ),
            ),
          ),
          const Expanded(
            child: Divider(color: Colors.grey, thickness: 1),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: const Color(0xFFFFFDF5),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📍 Location & Profile Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Home ▼',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 36, 41, 5),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.location_pin,
                              color: Color.fromARGB(255, 36, 41, 5), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            '1736 Pretorius Street, Arcadia',
                            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AccountScreen()),
                      );
                    },
                    child: const Icon(Icons.person_outline,
                        color: Color.fromARGB(255, 36, 41, 5), size: 26),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // 🔍 Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search dishes or kitchens',
                  prefixIcon:
                      const Icon(Icons.search, color: Color.fromARGB(255, 36, 41, 5)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFFF7E6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF5C7F4D)),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 🖼️ Auto Slider
              SizedBox(
                height: 200,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              // 👥 Specially For You
              _buildSectionHeader("Specially for You"),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryCard('Students', 'assets/icons/students.jpg'),
                  _buildCategoryCard('Elderly', 'assets/icons/elderly.jpg'),
                  _buildCategoryCard('Corporate', 'assets/icons/corporate.avif'),
                ],
              ),

              // 🍽️ Meal Subscription
              _buildSectionHeader("Meal Subscriptions"),

              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: todaysMenu.length + 1,
                  itemBuilder: (context, index) {
                    if (index < todaysMenu.length) {
                      final item = todaysMenu[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(item['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item['name']!,
                              style: const TextStyle(fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: _showFullMenuSheet,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFE0E0E0),
                                ),
                                child:
                                    const Icon(Icons.expand_more, color: Color.fromARGB(255, 36, 41, 5)),
                              ),
                              const SizedBox(height: 6),
                              const Text("View All", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}