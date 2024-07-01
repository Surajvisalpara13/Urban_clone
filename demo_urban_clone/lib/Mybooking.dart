import 'package:flutter/material.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  // Sample booking data
  final List<Map<String, String>> bookings = [
    {
      'date': '2023-07-01',
      'time': '10:00 AM',
      'type': 'AC Service and Repair',
    },
    {
      'date': '2023-07-02',
      'time': '12:00 PM',
      'type': 'Washing Machine Repair',
    },
    {
      'date': '2023-07-03',
      'time': '02:00 PM',
      'type': 'Refrigerator Repair',
    },
    {
      'date': '2023-07-04',
      'time': '04:00 PM',
      'type': 'Microwave Repair',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Booking',
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
                  image: NetworkImage('https://i.pinimg.com/564x/dd/d8/f4/ddd8f4461e91b0978aac1cb07d886289.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Content
          ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  title: Text('Booking Type: ${booking['type']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text('Date: ${booking['date']}'),
                      Text('Time: ${booking['time']}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyBookingScreen(),
  ));
}
