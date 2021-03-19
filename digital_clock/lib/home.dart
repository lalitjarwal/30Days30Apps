import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String time = "00:00:00";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var dateTime = DateTime.now();
      setState(() {
        time = '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
      });
    });

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/clock.png'),
            ClipOval(
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 60.0),
                child: Text(
                  '$time',
                  style: TextStyle(
                    fontFamily: 'DS-Digital',
                    color: Colors.lightGreen,
                    fontSize: 64,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
