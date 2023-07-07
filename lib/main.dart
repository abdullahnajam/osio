import 'package:flutter/material.dart';
import 'package:osio/navigator/bottom_nav.dart';
import 'package:osio/screens/home_page.dart';
import 'package:osio/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSIO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

