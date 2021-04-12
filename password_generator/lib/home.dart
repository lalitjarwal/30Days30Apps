import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/password_generator.dart';

///Stateful class for homepage widget, intializing with the [title] of the application
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  State<StatefulWidget> createState() => MyHomePageState();
}

///The homepage state
///
///Password generation is achieved through PasswordGenerator class
///[_letterCheckBool] initialized to true as to be activated upon startup of application,
///[_sliderVal] sets the sliders initial value to 6.0 as it ranges from 6-64 integer generation
class MyHomePageState extends State<MyHomePage> {
  PasswordGenerator _generator = PasswordGenerator();
  bool _letterCheckBool = true;
  bool _numCheckBool = false;
  bool _symCheckBool = false;
  double _sliderVal = 6.0;

  ///call to generate  slider value
  void generate() {
    setState(() {
      _generator.generate(_sliderVal.round());
    });
  }

  ///call to activate letter generation and change [_letterCheckBool] value
  void letterCheck(bool value) {
    setState(() {
      _generator.checkLetterGen(value);
      _letterCheckBool = value;
    });
  }

  ///call to activate number generation and change [_numCheckBool] value
  void numCheck(bool value) {
    setState(() {
      _generator.checkNumGen(value);
      _numCheckBool = value;
    });
  }

  ///call to activate symbol generation and change [_symCheckBool] value
  void symCheck(bool value) {
    setState(() {
      _generator.checkSymGen(value);
      _symCheckBool = value;
    });
  }

  ///call to change the sliders diplayed value to [_sliderVal]
  void sliderChange(double value) {
    setState(() {
      _sliderVal = value;
    });
  }

  ///Builds the homepage widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment),
            tooltip: "Copy",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Copied to Clipboard"),
                ),
              );
              Clipboard.setData(
                  ClipboardData(text: _generator.getGeneratedValue()));
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                _generator.getGeneratedValue(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: generate,
              child: Text("Generate"),
            ),
          ),
          Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text("Use letters"),
                value: _letterCheckBool,
                onChanged: (bool value) {
                  letterCheck(value);
                },
              ),
              CheckboxListTile(
                title: Text("Use numbers"),
                value: _numCheckBool,
                onChanged: (bool value) {
                  numCheck(value);
                },
              ),
              CheckboxListTile(
                title: Text("Use symbols"),
                value: _symCheckBool,
                onChanged: (bool value) {
                  symCheck(value);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Slider(
                  value: _sliderVal,
                  onChanged: (double value) {
                    sliderChange(value);
                  },
                  label: "Number of characters",
                  divisions: 9,
                  min: 6.0,
                  max: 24.0,
                ),
              ),
              Container(
                width: 50.0,
                child: Text(
                  _sliderVal.round().toString(),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
