import 'package:flutter/material.dart';

class Constants {
  static const Color primary = Color(0xff043E49);
  static const Color secondary = Color(0xff207C7D);
  static const Color dull = Color(0xff508488);
  static const Decoration boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
        Constants.primary,
        Constants.secondary,
      ]));
  static const TextStyle heading =
      TextStyle(color: Colors.white, fontSize: 46, fontWeight: FontWeight.bold);
  static const TextStyle quote = TextStyle(
    color: Colors.white,
    fontSize: 26,
  );
   static const buttonStyle = TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16);
  static Padding buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(left: 56.0),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: 18),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '$hint',
            hintStyle: TextStyle(
                color: Constants.dull,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2)),
      ),
    );
  }
}
