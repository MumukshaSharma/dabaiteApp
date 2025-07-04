import 'package:flutter/material.dart';

class StandardThaliPage extends StatefulWidget {
  const StandardThaliPage({super.key});

  @override
  State<StandardThaliPage> createState() => _StandardThaliPageState();
}

class _StandardThaliPageState extends State<StandardThaliPage> {
  int selectedDayIndex = 0;
  bool showCartPopup = false;
  bool showMorePopup = false;
  int quantity = 0;
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<String> menuOfTheWeek = [
    'Aloo Gobi, Dal, 3 Chapati',
    'Bhindi Masala, Salad, 3 Chapati',
    'Rajma, Rice, 2 Chapati',
    'Chole, Jeera Rice, 2 Chapati',
    'Mix Veg, Dal, 3 Chapati',
    'Paneer Butter, Rice, 2 Chapati',
    'Special Veg Thali',
  ];

  void _showMoreInfoDialog(String title, String info) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(info),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  void _showCartBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$quantity Item | ₹${quantity * 390}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 3,
              ),
              child: const Text("Go to Cart"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Standard Thali"),
        backgroundColor: const Color(0xFF242905),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MENU OF THE WEEK',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2ECDB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.green[900],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            days[selectedDayIndex],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Standard Thali',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(menuOfTheWeek[selectedDayIndex]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset('assets/images/thali_sample.png', width: 80),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(days[index]),
                    selected: selectedDayIndex == index,
                    onSelected: (_) {
                      setState(() {
                        selectedDayIndex = index;
                      });
                    },
                    selectedColor: const Color(0xFF242905),
                    labelStyle: TextStyle(
                      color: selectedDayIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'MEAL PLANS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildMealCard(
              title: 'Standard Thali - Trial (3 Days)',
              price: '390',
              info:
                  '3 Chapati, 1 Veg Curry, Cut Salad included. Delivered hot and fresh.',
            ),
            _buildMealCard(
              title: 'Standard Thali - Weekly',
              price: '749',
              info:
                  '3 Chapati, 1 Veg Curry, Cut Salad. 7-day plan with daily variety.',
            ),
            _buildMealCard(
              title: 'Standard Thali - Monthly',
              price: '2599',
              info:
                  '3 Chapati, 1 Veg Curry, Cut Salad. 30 meals. Best value.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealCard(
      {required String title,
      required String price,
      required String info}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () => _showMoreInfoDialog(title, info),
                    child: const Text(
                      'read more',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: quantity == 0
                  ? () {
                      setState(() => quantity = 1);
                      _showCartBottomSheet();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 4,
                side: const BorderSide(color: Color(0xFF242905)),
              ),
              child: const Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}
