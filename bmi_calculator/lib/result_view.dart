import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clippy_flutter/clippy_flutter.dart' as Arc;
import 'package:percent_indicator/percent_indicator.dart';

class Output extends StatelessWidget {
  Output(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final linearGradient = LinearGradient(
      colors: [Color(0xffa7469d), Color(0xff5e70f1)],
      stops: [0.0, 0.7],
      begin: Alignment.topRight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: linearGradient),
          child: Column(children: [
            SizedBox(
              height: 56,
            ),
            Text(
              'YOUR RESULT',
              textScaleFactor: 1.9,
              textWidthBasis: TextWidthBasis.parent,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
            Expanded(
              child: Arc.Arc(
                clipShadows: [
                  Arc.ClipShadow(color: Colors.black, elevation: 20)
                ],
                edge: Arc.Edge.TOP,
                height: 45,
                arcType: Arc.ArcType.CONVEY,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffe4e8fe),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new CircularPercentIndicator(
                        radius: 220.0,
                        lineWidth: 17.0,
                        animation: true,
                        percent: double.parse(bmiResult) * 3 / 100 > 1
                            ? 1.0
                            : double.parse(bmiResult) * 3 / 100,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Text(
                              '${this.bmiResult}',
                              textScaleFactor: 3,
                              style: new TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${this.resultText}',
                                textScaleFactor: 2,
                                style: new TextStyle(
                                  color: Color(0xff5e70f1),
                                ))
                          ],
                        ),
                        footer: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "${this.interpretation}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff5e70f1),
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //button
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              width: 300,
              height: 60,
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'RE-CALCULATE',
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
      ]),
    );
  }
}
