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

    // TODO: Handle navigation if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 232, 199),
      body: Column(
        children: [
          TopBar(
            isVeg: isVeg,
            setIsVeg: (val) => setState(() => isVeg = val),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  KitchensSection(),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      children: [
                        const Text(
                          'Welcome to mumuuu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 49, 57, 39),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Delicious homemade meals delivered fresh to your door',
                          style: TextStyle(
                            color: Color(0xFFA3B18A),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      // ✅ Custom Bottom Navigation Bar
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
          // ✅ Custom Home Icon from assets
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/homess.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),

          // ✅ Meal Deal without icon
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Meal Deal',
          ),

          // ✅ Orders
          const BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}