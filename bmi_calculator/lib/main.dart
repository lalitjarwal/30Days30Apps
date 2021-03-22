import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'result_view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'bmibrain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var age;
  var weight;
  var height;
  var bmidata;
  var result;
  var interpretation;
  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(
        colors: [Color(0xffa7469d), Color(0xff5e70f1)],
        stops: [0.0, 0.7],
        begin: Alignment.topRight);
    //var offset2 = Offset(10, 10);
    return Stack(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: linearGradient),
        child: Column(children: [
          SizedBox(
            height: 56,
          ),
          Text(
            'BMI CALCULATOR',
            textScaleFactor: 1.9,
            textWidthBasis: TextWidthBasis.parent,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400)),
          ),
          Expanded(
            child: Arc(
              clipShadows: [ClipShadow(color: Colors.black, elevation: 20)],
              edge: Edge.TOP,
              height: 45,
              arcType: ArcType.CONVEY,
              child: Container(
                width: double.infinity,
                //height: MediaQuery.of(context).size.height-56*6,
                //margin: EdgeInsets.only(bottom:120),
                decoration: BoxDecoration(
                  color: Color(0xffe4e8fe),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 56, top: 46),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SleekCircularSlider(
                                max: 200,
                                initialValue: 55,
                                appearance: CircularSliderAppearance(
                                    size: MediaQuery.of(context).size.width -
                                        180),
                                innerWidget: (value) {
                                  return Center(
                                      child: Text(
                                    '${value.round()} Kg',
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                    ),
                                    textScaleFactor: 1.5,
                                  ));
                                },
                                onChange: (value) {
                                  setState(() {
                                    weight = value.round();
                                  });
                                }),
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  'Weight',
                                  textScaleFactor: 1.6,
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SleekCircularSlider(
                                      appearance: CircularSliderAppearance(
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240),
                                      initialValue: 180,
                                      max: 260,
                                      innerWidget: (value) {
                                        return Center(
                                            child: Text(
                                          '${value.round()} cm',
                                          style: TextStyle(
                                            color: Colors.deepPurple,
                                          ),
                                          textScaleFactor: 1.5,
                                        ));
                                      },
                                      onChange: (value) {
                                        setState(() {
                                          height = value.round();
                                        });
                                      }),
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.deepPurple),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        'Height',
                                        textScaleFactor: 1.4,
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SleekCircularSlider(
                                      appearance: CircularSliderAppearance(
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240),
                                      initialValue: 22,
                                      innerWidget: (value) {
                                        return Center(
                                            child: Text(
                                          '${value.round()} Year',
                                          style: TextStyle(
                                            color: Colors.deepPurple,
                                          ),
                                          textScaleFactor: 1.5,
                                        ));
                                      },
                                      onChange: (value) {
                                        setState(() {
                                          age = value.round();
                                        });
                                      }),
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.deepPurple),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        'Age',
                                        textScaleFactor: 1.4,
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ]),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () {
            setState(() {
              var brain = CalculatorBrain(height: height, weight: weight);
              bmidata = brain.calculateBMI();
              interpretation = brain.getInterpretation();
              result = brain.getResult();
            });
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => Output(
                    interpretation: interpretation,
                    bmiResult: bmidata,
                    resultText: result)));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            width: 300,
            height: 60,
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'CALCULATE',
              textAlign: TextAlign.center,
              textScaleFactor: 1.6,
              textWidthBasis: TextWidthBasis.parent,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 10,
                    offset: Offset(10, 10),
                  )
                ],
                gradient: linearGradient,
                borderRadius: BorderRadius.circular(25)),
          ),
        ),
      )
    ]);
  }
}
