import 'package:analog_clock/clock_body.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.grey[800],
              secondary: Colors.grey[900],
              secondaryVariant: Colors.grey[700],
              primaryVariant: Colors.white)),
      home: Scaffold(
        body: ClockBody(),
      ),
    );
  }
}
