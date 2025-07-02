import 'package:flutter/material.dart';

class Kitchen {
  final String name;
  final String specialty;
  final double rating;
  final String deliveryTime;
  final String emoji;
  final List<Color> gradient;
  final String imagePath; // ✅ image path from assets

  Kitchen({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.deliveryTime,
    required this.emoji,
    required this.gradient,
    required this.imagePath,
  });
}

class KitchensSection extends StatelessWidget {
  final List<Kitchen> kitchens = [
   Kitchen(
  name: "Mama's Kitchen",
  specialty: "North Indian Homestyle",
  rating: 4.5,
  deliveryTime: "25-30 mins",
  emoji: "👩‍🍳",
  gradient: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
  imagePath: 'assets/images/cook1.avif', // ✅ EXACT match
),
Kitchen(
  name: "Delhi Delights",
  specialty: "Street Food & Chaat",
  rating: 4.3,
  deliveryTime: "20-25 mins",
  emoji: "🏪",
  gradient: [Color(0xFFFFF9C4), Color(0xFFFFF176)],
  imagePath: 'assets/images/delhi3.jpg', // ✅ EXACT match
),
Kitchen(
  name: "South Spice",
  specialty: "Authentic South Indian",
  rating: 4.7,
  deliveryTime: "30-35 mins",
  emoji: "🌶️",
  gradient: [Color(0xFFFFCDD2), Color(0xFFE57373)],
  imagePath: 'assets/images/south.jpg', // ✅ EXACT match
),
Kitchen(
  name: "Punjabi Tadka",
  specialty: "Punjabi & Tandoor",
  rating: 4.4,
  deliveryTime: "25-30 mins",
  emoji: "🫓",
  gradient: [Color(0xFFC8E6C9), Color(0xFF81C784)],
  imagePath: 'assets/images/punjabi.jpg', // ✅ EXACT match
),

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Kitchens",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C7F4D),
                ),
              ),
              Row(
                children: [
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Color(0xFF5C7F4D),
                      fontSize: 14,
                    ),
                  ),
                  Icon(Icons.arrow_forward, size: 16, color: Color(0xFF5C7F4D))
                ],
              )
            ],
          ),
          SizedBox(height: 12),

          // Grid
          GridView.count(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  crossAxisCount: 2,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  childAspectRatio: 3 / 4, // ✅ THIS makes sure your images get space
            children: kitchens.map((kitchen) {
              return Container(
  height: 180, // ✅ Set a fixed height for card
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 2),
    ],
  ),
  child: Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Opacity(
          opacity: 0.8, // ✅ adjust to your liking
          child: Image.asset(
            kitchen.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
      // ... rest remains unchanged

                    // ✅ Gradient Overlay
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: kitchen.gradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    // ✅ Content
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              kitchen.emoji,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            kitchen.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF4E6746)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            kitchen.specialty,
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF90A97D)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 14),
                                  Text(
                                    '${kitchen.rating}',
                                    style: TextStyle(
                                        color: Color(0xFF4E6746),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer, size: 14, color: Colors.grey),
                                  Text(
                                    kitchen.deliveryTime,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}