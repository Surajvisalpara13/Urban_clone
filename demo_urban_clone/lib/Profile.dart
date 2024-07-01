import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Dummy user data
  String userName = 'John Doe';
  String userAddress = '123 Main St, Springfield';
  String aboutUC = 'Urban Company is your one-stop solution for all your home services needs.';

  void _logout() {
    // Add logout functionality here
    print('User logged out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          ),
        ],
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
          // Semi-transparent overlay for better readability
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.account_circle, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'User Name: $userName',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.location_on, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'User Address: $userAddress',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.info, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'About UC (Urban Company)',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  aboutUC,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
