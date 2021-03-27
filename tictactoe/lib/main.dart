import 'package:flutter/material.dart';
import 'package:tictactoe/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEAF0F1),
      ),
      home: HomePage(),
    );
  }
}
