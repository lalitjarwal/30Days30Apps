import 'dart:ui';
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

class _HomeState extends State<Home> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.black,
    Colors.teal,
    Colors.lime,
    Colors.orange,
  ];
  List<Offset> _points = [];
  Color strokeColor = Colors.blue;
  double strokeWidth = 2.0;
  void clear() {
    setState(() {
      _points.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton.extended(onPressed: clear, label: Text('Clear')),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  RenderBox object = context.findRenderObject();
                  Offset _localPosition =
                      object.globalToLocal(details.globalPosition);
                  _points = new List.from(_points)..add(_localPosition);
                });
              },
              onPanEnd: (DragEndDetails details) => _points.add(null),
              child: CustomPaint(
                size: MediaQuery.of(context).size,
                painter: SignaturePainter(
                    points: _points,
                    strokeColor: strokeColor,
                    strokeWidth: strokeWidth),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Slider(
                  label: '$strokeWidth',
                  divisions: 7,
                  min: 1.0,
                  max: 8.0,
                  value: strokeWidth,
                  onChanged: (value) {
                    strokeWidth = value;
                    setState(() {});
                  }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 10; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          strokeColor = colors[i];
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        color: colors[i],
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  final double strokeWidth;
  final List<Offset> points;
  final Color strokeColor;
  Paint _linePaint;

  SignaturePainter(
      {@required this.points,
      @required this.strokeColor,
      @required this.strokeWidth}) {
    _linePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], _linePaint);
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
