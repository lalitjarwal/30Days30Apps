import 'package:analog_clock/clock_face.dart';
import 'package:flutter/material.dart';

class ClockBody extends StatefulWidget {
  @override
  _ClockBodyState createState() => _ClockBodyState();
}

class _ClockBodyState extends State<ClockBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            //Clock body
            width: 300, //Make sure that clock body fills parent
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                BoxShadow(
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
              ],
            ),

            child: ClockFace(),
          ),
        ],
      ),
    );
  }
}
