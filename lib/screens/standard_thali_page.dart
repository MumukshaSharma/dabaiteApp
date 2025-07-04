import 'package:flutter/material.dart';

class StandardThaliPage extends StatefulWidget {
  const StandardThaliPage({super.key});

  @override
  State<StandardThaliPage> createState() => _StandardThaliPageState();
}

class _StandardThaliPageState extends State<StandardThaliPage> {
  int selectedDayIndex = 0;
  int quantity = 1;

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

  bool showMoreInfo = false;

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
            Text(
              'MENU OF THE WEEK',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[800]),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2ECDB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(days.length, (index) {
                return ChoiceChip(
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
                          : Colors.black),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text(
              'MEAL PLANS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildMealCard(
                title: 'Standard Thali - Trial (3 Days)',
                oldPrice: '540',
                newPrice: '390',
                info: '3 Chapati, 1 Veg Curry'),
            _buildMealCard(
                title: 'Standard - Weekly',
                oldPrice: '899',
                newPrice: '749',
                info: '3 Chapati, 1 Veg...'),
            _buildMealCard(
                title: 'Standard - Monthly',
                oldPrice: '3599',
                newPrice: '2599',
                info: '3 Chapati, 1 Veg...'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Color(0xFF4CAF50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$quantity Item | ₹${quantity * 390}',
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.white),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMealCard(
      {required String title,
      required String oldPrice,
      required String newPrice,
      required String info}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text('₹$oldPrice',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey)),
                const SizedBox(width: 6),
                Text('₹$newPrice',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                setState(() {
                  showMoreInfo = !showMoreInfo;
                });
              },
              child: Text(
                showMoreInfo ? info : 'read more',
                style: const TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF242905),
              ),
              child: const Text('ADD'),
            )
          ],
        ),
      ),
    );
  }
}