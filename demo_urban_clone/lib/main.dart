import 'package:demo_urban_clone/Register.dart';
import 'package:demo_urban_clone/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:demo_urban_clone/HomeScreen.dart';
import 'package:demo_urban_clone/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),

        '/Splash': (context) => SplashScreen(),

      },
    );
  }
}
