import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        title: 'Material App',
        home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast without any package!'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            var overlayEntry = OverlayEntry(builder: (context) {
              return Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Hey, I am a Toast!',
                        textScaleFactor: 1.2,
                      )),
                ),
              );
            });

            Overlay.of(context).insert(overlayEntry);

            Future.delayed(Duration(seconds: 1), () {
              print('I ran');
              overlayEntry.remove();
            });
          },
          label: Text('Show')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
