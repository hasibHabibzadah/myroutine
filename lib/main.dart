import 'package:flutter/material.dart';
import 'package:myroutine/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp ext
ends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routine App',
      home : Home(),
    );
  }
}

