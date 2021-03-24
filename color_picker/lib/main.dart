import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class _HomeState extends State<Home> {
  var red = 0.0;
  var green = 0.0;
  var blue = 0.0;
  @override
  Widget build(BuildContext context) {
    var _color = Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25.0),
        width: double.infinity,
        height: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(color: _color, width: 6.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0), color: _color),
            ),
            SizedBox(
              height: 20,
            ),
            Slider(
                activeColor: Colors.red,
                label: '$red',
                min: 0.0,
                max: 255.0,
                value: red,
                onChanged: (value) {
                  setState(() {
                    red = value;
                  });
                }),
            Slider(
                activeColor: Colors.green,
                min: 0.0,
                max: 255.0,
                value: green,
                onChanged: (value) {
                  setState(() {
                    green = value;
                  });
                }),
            Slider(
                activeColor: Colors.blue,
                min: 0.0,
                max: 255.0,
                value: blue,
                onChanged: (value) {
                  setState(() {
                    blue = value;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            Text(
              'Color : #${_color.toString().substring(10, 16)}',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: _color),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(
                      text: '#${_color.toString().substring(10, 16)}'));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Copied to clipboard'),
                    behavior: SnackBarBehavior.floating,
                  ));
                },
                child: Text('Copy'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_color)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
