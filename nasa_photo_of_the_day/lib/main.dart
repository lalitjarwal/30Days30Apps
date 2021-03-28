import 'package:flutter/material.dart';
import 'package:nasa_photo_of_the_day/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Flutter';
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        title: title,
        home:NasaHome());
  }
}