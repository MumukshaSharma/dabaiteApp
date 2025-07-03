import 'package:flutter/material.dart';
import '/widgets/top_bar.dart';
import '/widgets/kitchens_section.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  bool isVeg = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/subscribe');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/kitchens');
    }
  }

  Widget _buildCategoryCard(String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF4E6746),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 232, 199),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(
              isVeg: isVeg,
              setIsVeg: (val) => setState(() => isVeg = val),
            ),
            const SizedBox(height: 12),

            // "Specially for You" Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Specially for You",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5C7F4D),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCategoryCard(
                        'Students',
                        'assets/icons/students.jpg',
                        () {
                          Navigator.pushNamed(context, '/student-plan');
                        },
                      ),
                      _buildCategoryCard(
                        'Elderly',
                        'assets/icons/elderly.jpg',
                        () {
                          Navigator.pushNamed(context, '/elderly-plan');
                        },
                      ),
                      _buildCategoryCard(
                        'Corporate',
                        'assets/icons/corporate.avif',
                        () {
                          Navigator.pushNamed(context, '/corporate-plan');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            KitchensSection(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: const [
                  Text(
                    'Welcome to Dabite',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 49, 57, 39),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Delicious homemade meals delivered fresh to your door',
                    style: TextStyle(
                      color: Color(0xFFA3B18A),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      // Bottom Navigation Bar
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
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/homess.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscribe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Kitchens',
          ),
        ],
      ),
    );
  }
}