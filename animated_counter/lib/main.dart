import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController animation;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    animation = AnimationController(
        value: 250.0,
        vsync: this,
        lowerBound: 1.0,
        upperBound: 250.0,
        duration: Duration(milliseconds: 200),
        reverseDuration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            animation.reverse();

            Future.delayed(Duration(milliseconds: 500), () {
              setState(() {
                animation.forward();
                counter++;
              });
            });
          });
        },
        child: Icon(Icons.add),
      ),
      body: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: animation.value,
                    width: 180,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomCenter,
                      child: Text('$counter'),
                    )),
                Container(
                  width: 180,
                  height: 10,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(6, 6), blurRadius: 8.0, color: Colors.grey)
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
