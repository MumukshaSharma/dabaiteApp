import 'dart:async';
import 'package:flutter/material.dart';

const Color kelp = Color.fromARGB(255, 36, 41, 5);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

class StudentPlanPage extends StatefulWidget {
  @override
  _StudentPlanPageState createState() => _StudentPlanPageState();
}

class _StudentPlanPageState extends State<StudentPlanPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<Map<String, String>> thaliList = [
    {
      'day': 'Mon',
      'menu': 'Chole Masala / Aloo Methi, 3 Chapati, Dal, Steam Rice, 1 Sweet & Salad.',
      'image': 'assets/menu_monday.jpg'
    },
    {
      'day': 'Tue',
      'menu': 'Rajma / Mix Veg, 3 Chapati, Dal, Rice, 1 Sweet & Salad.',
      'image': 'assets/menu_tuesday.jpg'
    },
    {
      'day': 'Wed',
      'menu': 'Aloo Gobi / Bharva Baingan, 3 Chapati, Dal, Rice, Sweet & Salad.',
      'image': 'assets/menu_wednesday.jpg'
    },
    {
      'day': 'Thu',
      'menu': 'Lauki Kofta / Bhindi, 3 Chapati, Dal, Rice, Sweet & Salad.',
      'image': 'assets/menu_thursday.jpg'
    },
    {
      'day': 'Fri',
      'menu': 'Paneer Butter Masala, 3 Chapati, Dal, Rice, Sweet & Salad.',
      'image': 'assets/menu_friday.jpg'
    },
    {
      'day': 'Sat',
      'menu': 'Mix Veg / Aloo Jeera, 3 Chapati, Dal, Rice, Sweet & Salad.',
      'image': 'assets/menu_saturday.jpg'
    },
    {
      'day': 'Sun',
      'menu': 'Kadhi Pakoda, 3 Chapati, Dal, Rice, Sweet & Salad.',
      'image': 'assets/menu_sunday.jpg'
    },
  ];

  final List<Map<String, dynamic>> plans = [
    {'name': 'Standard Thali - Trial (3 Days)', 'old': 540, 'new': 390},
    {'name': 'Deluxe Thali - Trial (3 Days)', 'old': 675, 'new': 525},
    {'name': 'Special Thali - Trial (3 Days)', 'old': 810, 'new': 660},
    {'name': '3 Day Plan - Flexi', 'old': 779, 'new': 689},
    {'name': '7 Day Plan - Flexi', 'old': 1819, 'new': 1539},
    {'name': '14 Day Plan - Flexi', 'old': 3639, 'new': 2939},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentIndex < thaliList.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget buildThaliCard(Map<String, String> thali) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(thali['image']!, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                '${thali['day']} Special Thali\n${thali['menu']}',
                style: TextStyle(color: kelp, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPlanCard(Map<String, dynamic> plan) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plan['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('₹${plan['old']} ',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  Text('₹${plan['new']}', style: TextStyle(color: kelp))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: kelp),
              child: Text("ADD"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: starkWhite,
      appBar: AppBar(
        backgroundColor: starkWhite,
        title: Text('Menu of the Week', style: TextStyle(color: kelp)),
        iconTheme: IconThemeData(color: kelp),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemCount: thaliList.length,
                itemBuilder: (context, index) => buildThaliCard(thaliList[index]),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(thaliList.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    _pageController.jumpToPage(index);
                    setState(() => _currentIndex = index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex == index ? kelp : Colors.white,
                    foregroundColor: _currentIndex == index ? Colors.white : kelp,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Text(thaliList[index]['day']!),
                );
              }),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Meal Plans", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kelp)),
              ),
            ),
            ...plans.map(buildPlanCard).toList(),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Why You Need This", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kelp)),
                  SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset("assets/why_you_need_this.jpg"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
