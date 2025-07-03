import 'dart:async';
import 'package:flutter/material.dart';

const Color kelp = Color.fromARGB(255, 36, 41, 5);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color.fromARGB(255, 242, 236, 219);

class ElderlyPlanPage extends StatefulWidget {
  @override
  _ElderlyPlanPageState createState() => _ElderlyPlanPageState();
}

class _ElderlyPlanPageState extends State<ElderlyPlanPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<Map<String, String>> thaliList = [
    {
      'day': 'Mon',
      'menu': 'Moong Dal Khichdi, Curd, Boiled Veggies, Chapati.',
      'image': 'assets/elderly_mon.jpg'
    },
    {
      'day': 'Tue',
      'menu': 'Lauki Sabzi, Soft Chapati, Arhar Dal, Rice.',
      'image': 'assets/elderly_tue.jpg'
    },
    {
      'day': 'Wed',
      'menu': 'Tinda Curry, Chapati, Masoor Dal, Boiled Salad.',
      'image': 'assets/elderly_wed.jpg'
    },
    {
      'day': 'Thu',
      'menu': 'Pumpkin Sabzi, Moong Dal, Rice, Soft Roti.',
      'image': 'assets/elderly_thu.jpg'
    },
    {
      'day': 'Fri',
      'menu': 'Daliya Upma, Curd, Boiled Veggies.',
      'image': 'assets/elderly_fri.jpg'
    },
    {
      'day': 'Sat',
      'menu': 'Vegetable Soup, Rice, Khichdi, Buttermilk.',
      'image': 'assets/elderly_sat.jpg'
    },
    {
      'day': 'Sun',
      'menu': 'Paneer Bhurji, Chapati, Light Dal.',
      'image': 'assets/elderly_sun.jpg'
    },
  ];

  final List<Map<String, dynamic>> plans = [
    {'name': 'Soft Meal Plan - 3 Days', 'old': 500, 'new': 399},
    {'name': 'Healthy Digest Plan - 7 Days', 'old': 1200, 'new': 999},
    {'name': 'Balanced Diet Plan - 14 Days', 'old': 2400, 'new': 1899},
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
            BoxShadow(color: kelp, blurRadius: 4)
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
                      )),
                  Text('₹${plan['new']}', style: TextStyle(color: kelp)),
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
        title: Text('Elderly Meal Plans', style: TextStyle(color: kelp)),
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
                  Text("Why This is Ideal for Elders", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kelp)),
                  SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset("assets/why_elderly_plan.jpg"),
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