import 'package:flutter/material.dart';
import 'package:lorewaver/Presentation/Screens/welckomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 26, 26, 47),
    brightness: Brightness.dark, // 👈 This makes surface dark
  ),
),

      home: Welckomescreen(),
    );
  }
}
 
 
