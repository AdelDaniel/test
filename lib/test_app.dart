import 'package:flutter/material.dart';
import 'package:test/home_screen.dart';

/// Root widget of the test app
class TestApp extends StatelessWidget {
  /// The TestRoot Const Constructor
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'test',
      home: HomeScreen(),
    );
  }
}
