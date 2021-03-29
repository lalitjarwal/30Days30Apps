import 'package:flutter/material.dart';
import 'package:user_onboard/home.dart';
import 'package:user_onboard/login.dart';
import 'package:user_onboard/storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: title,
      home: FutureBuilder(
          future: Storage().loginStatus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data)
                return Home();
              else
                return LoginScreen();
            } else
              return Scaffold(
                  body: Center(
                child: FlutterLogo(
                  size: 120,
                ),
              ));
          }),
    );
  }
}
