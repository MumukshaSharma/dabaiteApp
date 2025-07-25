import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/account.dart';
import '../screens/corporate.dart';
import '../screens/elderly.dart';
import '../screens/standard_thali_page.dart';
import '../screens/deluxe_thali_page.dart';
import '../screens/special_thali_page.dart';
import '../screens/breakfast_page.dart';
import '../screens/jain_thali_page.dart';
import '../screens/non_thali_page.dart';

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

  final List<String> images = ['assets/images/2.jpg', 'assets/images/tab3.jpg'];

  final List<Map<String, String>> todaysMenu = [
    {'name': 'Rajma Chawal', 'image': 'assets/images/rajma.jpg'},
    {'name': 'Kadhi Chawal', 'image': 'assets/images/kadhi.jpeg'},
    {'name': 'Khichdi', 'image': 'assets/images/khichdi.webp'},
    {'name': 'Poha', 'image': 'assets/images/poha.jpg'},
    {'name': 'Idli', 'image': 'assets/images/idli.jpg'},
  ];

  final List<Map<String, String>> mealSubscriptions = [
    {'name': 'Standard Thali', 'image': 'assets/meals/standard_thali.avif'},
    {'name': 'Deluxe Thali', 'image': 'assets/meals/deluxe_thali.webp'},
    {'name': 'Special Thali', 'image': 'assets/meals/special_thali.webp'},
    {'name': 'Breakfast', 'image': 'assets/meals/breakfast.jpg'},
    {'name': 'Jain Thali', 'image': 'assets/meals/jain_thali.jpeg'},
    {'name': 'Non-Veg thali', 'image': 'assets/meals/non.jpg.webp'},
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
              // 📍 Top Location & Profile
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
                          const Icon(
                            Icons.location_pin,
                            color: Color.fromARGB(255, 36, 41, 5),
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '1736 Pretorius Street, Arcadia',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
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
                    child: const Icon(
                      Icons.person_outline,
                      color: Color.fromARGB(255, 36, 41, 5),
                      size: 26,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // 🔍 Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search dishes or kitchens',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 36, 41, 5),
                  ),
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

              _buildSectionHeader("Specially for You"),

              // 👥 Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryCard(
                    'Students',
                    'assets/icons/students.jpg',
                    onTap: () {
                      Navigator.pushNamed(context, '/student-plan');
                    },
                  ),
                  _buildCategoryCard(
                    'Elderly',
                    'assets/icons/elderly.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ElderlyPlanPage(),
                        ),
                      );
                    },
                  ),
                  _buildCategoryCard(
                    'Corporate',
                    'assets/icons/corporate.avif',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CorporatePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              _buildSectionHeader("Meal Subscriptions"),

              // 🍽️ Meal Grid with Navigation
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.85,
                children: mealSubscriptions.map((meal) {
                  return GestureDetector(
                    onTap: () {
                      if (meal['name'] == 'Standard Thali') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StandardThaliPage(),
                          ),
                        );
                      } else if (meal['name'] == 'Deluxe Thali') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeluxeThaliPage(),
                          ),
                        );
                      } else if (meal['name'] == 'Special Thali') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SpecialThaliPage(),
                          ),
                        );
                      } else if (meal['name'] == 'Breakfast') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BreakfastPage(),
                          ),
                        );
                      } else if (meal['name'] == 'Jain Thali') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JainThaliPage(),
                          ),
                        );
                      } else if (meal['name'] == 'Non-Veg thali') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NonThaliPage(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            meal['image']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          meal['name']!,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
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
          const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    String title,
    String imagePath, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
