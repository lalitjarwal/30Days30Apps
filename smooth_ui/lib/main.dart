import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_ui/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth UI',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      ),
      home: SignIn(),
    );
  }
}
