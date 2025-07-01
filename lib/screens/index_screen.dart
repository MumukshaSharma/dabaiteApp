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

    // Handle navigation if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 232, 199),
      body: Column(
        children: [
          TopBar(isVeg: isVeg, setIsVeg: (val) => setState(() => isVeg = val)),

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
                          'Welcome to Dabite!',
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

      // ✅ Customized Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 39, 44, 23), // Active color
        unselectedItemColor: const Color.fromARGB(255, 91, 102, 72), // Inactive color
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins', // Optional: customize your font
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins', // Optional
        ),
        items: const [
          // Home icon with custom color
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant, color: Color.fromARGB(255, 39, 44, 23)),
            label: 'Home',
          ),

          // Meal Deal with NO icon
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Hides the icon
            label: 'meal deal',
          ),

          // Orders (default receipt icon)
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}