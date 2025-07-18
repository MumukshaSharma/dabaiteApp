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
      Navigator.pushNamed(context, '/kitchens');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/cart');
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         "Specially for You",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: Color(0xFF5C7F4D),
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           _buildCategoryCard(
            //             'Students',
            //             'assets/icons/students.jpg',
            //             () {
            //               Navigator.pushNamed(context, '/student-plan');
            //             },
            //           ),
            //           _buildCategoryCard(
            //             'Elderly',
            //             'assets/icons/elderly.jpg',
            //             () {
            //               Navigator.pushNamed(context, '/elderly-plan');
            //             },
            //           ),
            //           _buildCategoryCard(
            //             'Corporate',
            //             'assets/icons/corporate.avif',
            //             () {
            //               Navigator.pushNamed(context, '/corporate-plan');
            //             },
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            // const SizedBox(height: 12),
            // KitchensSection(),

// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text(
//         "Why Choose Dabite?",
//         style: TextStyle(
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//           color: Color(0xFF242905),
//           letterSpacing: 0.5,
//         ),
//       ),
//       const SizedBox(height: 12),
//       GridView.count(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         crossAxisCount: 2,
//         mainAxisSpacing: 16,
//         crossAxisSpacing: 16,
//         childAspectRatio: 1,
//         children: const [
//           _BenefitCard(
//             icon: Icons.home_filled,
//             title: "Homestyle Meals",
//             subtitle: "Tastes like home, every bite comforting.",
//           ),
//           _BenefitCard(
//             icon: Icons.health_and_safety,
//             title: "Nutritious & Fresh",
//             subtitle: "No compromise on quality or health.",
//           ),
//           _BenefitCard(
//             icon: Icons.subscriptions,
//             title: "Affordable Plans",
//             subtitle: "Budget-friendly daily meal plans.",
//           ),
//           _BenefitCard(
//             icon: Icons.emoji_people,
//             title: "Made by Locals",
//             subtitle: "Support home chefs & small kitchens.",
//           ),
//         ],
//       ),
//     ],
//   ),
// ),
const WhyChooseDabite(),




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
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Kitchens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
class _BenefitCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _BenefitCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDFBF3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFE4EAC6),
            child: Icon(icon, color: Color(0xFF242905)),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Color(0xFF242905),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF5C6B44),
            ),
          ),
        ],
      ),
    );
  }
}
class WhyChooseDabite extends StatelessWidget {
  const WhyChooseDabite({super.key});

  @override
  Widget build(BuildContext context) {
    const kelp = Color.fromARGB(255, 36, 41, 5);
    const starkWhite = Color.fromARGB(255, 242, 236, 219);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why Choose Dabite?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kelp,
            ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = (constraints.maxWidth - 24) / 2;
              final cardHeight = 160.0;
              final aspectRatio = cardWidth / cardHeight;

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: aspectRatio,
                children: const [
                  _BenefitCard(
                    icon: Icons.home_filled,
                    title: "Homestyle Meals",
                    subtitle: "Tastes like home, every bite comforting.",
                  ),
                  _BenefitCard(
                    icon: Icons.health_and_safety,
                    title: "Nutritious & Fresh",
                    subtitle: "No compromise on quality or health.",
                  ),
                  _BenefitCard(
                    icon: Icons.subscriptions,
                    title: "Affordable Plans",
                    subtitle: "Budget-friendly daily meal plans.",
                  ),
                  _BenefitCard(
                    icon: Icons.emoji_people,
                    title: "Made by Locals",
                    subtitle: "Support home chefs & small kitchens.",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

