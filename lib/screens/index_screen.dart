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
  bool _dialogShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_dialogShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSubscriptionDialog();
        _dialogShown = true;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showSubscriptionDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 14,
                      child: Icon(Icons.close, size: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Exclusive Offer',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Unlimited free deliveries\n& more',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 243, 217),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.workspace_premium, color: Colors.black87),
                      SizedBox(width: 10),
                      Text(
                        '3-month DABITE Gold at just ₹30',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigate to subscription screen if needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text(
                    'Join Gold now',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 232, 199),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  KitchensSection(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      children: const [
                        Text(
                          'Welcome to dabite',
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
          ),
          TopBar(
            isVeg: isVeg,
            setIsVeg: (val) => setState(() => isVeg = val),
          ),
        ],
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
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/homess.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Meal Deal',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}