import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rewards',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Background image
          Center(
            child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/564x/dd/d8/f4/ddd8f4461e91b0978aac1cb07d886289.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Semi-transparent overlay for better readability
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Content
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Gift Card
              Card(
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.card_giftcard, color: Colors.white, size: 40),
                          SizedBox(width: 10),
                          Text(
                            'Gift Card',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Get a gift card worth \$50 for Urban Company services!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Coupon Card 1
              Card(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_offer, color: Colors.white, size: 40),
                          SizedBox(width: 10),
                          Text(
                            'Coupon Code: SAVE20',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Use this coupon to save 20% on your next service booking!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Coupon Card 2
              Card(
                color: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_offer, color: Colors.white, size: 40),
                          SizedBox(width: 10),
                          Text(
                            'Coupon Code: FREEDEL',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Use this coupon for free delivery on your next service!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RewardsScreen(),
  ));
}
