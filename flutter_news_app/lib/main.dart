import 'package:flutter/material.dart';

import 'package:flutter_news_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
