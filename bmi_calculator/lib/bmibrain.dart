import 'dart:math';

import 'package:flutter/foundation.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    this._bmi = this.weight / pow(this.height / 100, 2);
    return this._bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (this._bmi >= 25) {
      return "Overweight";
    }
    if (this._bmi > 18.5) {
      return "Normal";
    }
    return "Underweight";
  }

  String getInterpretation() {
    if (this._bmi >= 25) {
      return "You have a higher than normal weight. Try exercising more.";
    }
    if (this._bmi > 18.5) {
      return "You have a normal weight. Good job!";
    }
    return "You have a lower than normal body weight. You can eat a bit more.";
  }
}