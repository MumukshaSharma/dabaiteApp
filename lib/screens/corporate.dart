import 'dart:async';
import 'package:flutter/material.dart';

const Color kelp = Color.fromARGB(255, 36, 41, 5);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

class CorporatePage extends StatefulWidget {
  const CorporatePage({super.key});

  @override
  State<CorporatePage> createState() => _CorporatePageState();
}

class _CorporatePageState extends State<CorporatePage> {
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int selectedIndex = DateTime.now().weekday - 1;

  late final PageController _pageController;
  late final Timer _timer;
  int _currentPage = 0;
final List<Map<String, String>> menuSlides = [
  {
    'day': 'MONDAY',
    'title': 'Standard Thali',
    'desc': 'Aloo Gobi, 3 Chapati, Dal, Jeera Rice, Pickle.',
    'image': 'assets/meals/standard_thali.avif',
  },
  {
    'day': 'TUESDAY',
    'title': 'Healthy Bowl',
    'desc': 'Brown Rice, Moong Salad, 2 Chapati, Curd.',
    'image': 'assets/meals/healthy.webp',
  },
  {
    'day': 'WEDNESDAY',
    'title': 'Deluxe Thali',
    'desc': 'Paneer Bhurji, 3 Chapati, Dal Fry, Rice, Salad.',
    'image': 'assets/meals/deluxe_thali.webp',
  },
  {
    'day': 'THURSDAY',
    'title': 'Protein Meal',
    'desc': 'Grilled Paneer, Brown Rice, Sprout Salad.',
    'image': 'assets/meals/protein_meal.png',
  },
  {
    'day': 'FRIDAY',
    'title': 'Special Thali',
    'desc': 'Shahi Paneer, 3 Roti, Dal Makhani, Rice, Sweet.',
    'image': 'assets/meals/special_thali.webp',
  },
  {
    'day': 'SATURDAY',
    'title': 'Jain Thali',
    'desc': 'Lauki Curry, 3 Chapati, Dal, Steamed Rice.',
    'image': 'assets/meals/jain_thali.jpeg',
  },
  {
    'day': 'SUNDAY',
    'title': 'Weekend Special',
    'desc': 'Roti, Aloo-Beans, Rice, Salad, Raita.',
    'image': 'assets/meals/sun.jpg',
  },
];

  final List<Map<String, dynamic>> plans = [
    {
      'title': '14 Day Plan - Flexi',
      'originalPrice': 3639,
      'discountedPrice': 2939,
      'description': '3 Chapati/Roti, 1 Veg...',
    },
    {
      'title': 'Standard - Monthly',
      'originalPrice': 3599,
      'discountedPrice': 2599,
      'description': '3 Chapati, 1 Veg...',
    },
    {
      'title': 'Deluxe - Monthly',
      'originalPrice': 4499,
      'discountedPrice': 3499,
      'description': '3 Chapati/Roti, Dal...',
    },
    {
      'title': 'Special Thali - Monthly',
      'originalPrice': 5399,
      'discountedPrice': 4399,
      'description': '3 Chapati/Roti, 1 Veg...',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < menuSlides.length - 1) {
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
    return Scaffold(
      backgroundColor: starkWhite,
      appBar: AppBar(
        backgroundColor: starkWhite,
        elevation: 0,
        leading: BackButton(color: kelp),
        title: const Text(
          'Corporate Plan',
          style: TextStyle(
            color: kelp,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Menu of the Week'),
            const SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: PageView.builder(
                controller: _pageController,
                itemCount: menuSlides.length,
                itemBuilder: (context, index) {
                  final item = menuSlides[index];
                  return _buildMenuCard(item);
                },
              ),
            ),
            const SizedBox(height: 12),
            _daySelector(),
            const SizedBox(height: 20),
            _sectionTitle('Meal Plans'),
            const SizedBox(height: 12),
            ...plans.map((plan) => _planCard(plan)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: kelp,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }

  Widget _buildMenuCard(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: kelp,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    item['day']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item['title']!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kelp),
                ),
                const SizedBox(height: 4),
                Text(
                  item['desc']!,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item['image']!,
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _daySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        final isSelected = index == selectedIndex;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? kelp : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kelp),
            ),
            child: Text(
              days[index],
              style: TextStyle(
                color: isSelected ? Colors.white : kelp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _planCard(Map<String, dynamic> plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 14, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kelp,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '₹ ${plan['originalPrice']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '₹ ${plan['discountedPrice']}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    text: plan['description'],
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
                    children: const [
                      TextSpan(
                        text: ' read more',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.black12,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {},
            child: const Text(
              'ADD',
              style: TextStyle(color: kelp, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}