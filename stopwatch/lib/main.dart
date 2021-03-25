import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stopwatch stopwatch = Stopwatch();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  List<String> lastElapsed = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${stopwatch.elapsed.toString().substring(0, 7)}',
                style: TextStyle(fontSize: 86, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              stopwatch.start();
                            });
                          },
                          child: Text('Start'))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              stopwatch.stop();
                            });
                          },
                          child: Text('Stop '))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            lastElapsed.add(
                                '${stopwatch.elapsed.toString().substring(0, 7)}');
                            setState(() {
                              stopwatch.reset();
                            });
                          },
                          child: Text('Reset'))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Last Elapsed :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: lastElapsed.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(
                          lastElapsed[index],
                          style: TextStyle(fontSize: 18),
                        )),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
