import 'package:flutter/material.dart';
import 'package:lorewaver/Presentation/Screens/welckomeScreen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 26, 26, 47),
          brightness: Brightness.dark,
        ),
      ),
      home: Welckomescreen(),
    );
  }
}
 
