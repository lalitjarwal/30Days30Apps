import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'Email Sign In',
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        centerTitle: true,
        title: 'Register'.makeText(),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: registerUser, label: 'Register'.makeText()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _passController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your Password'),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  'Have an Account?'.makeText(),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: 'Login'.makeText())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "${_emailController.text.trim()}",
              password: "${_passController.text.trim()}");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: 'User succesfully registered'.makeText()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        centerTitle: true,
        title: 'Login'.makeText(),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: loginUser, label: 'Login'.makeText()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _passController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "${_emailController.text.trim()}",
              password: "${_passController.text.trim()}");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: 'User succesfully Logged In'.makeText()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

extension makeWidget on String {
  Text makeText(
          {Key key,
          TextStyle style,
          StrutStyle strutStyle,
          TextAlign textAlign,
          TextDirection textDirection,
          Locale locale,
          bool softWrap,
          TextOverflow overflow,
          double textScaleFactor,
          int maxLines,
          String semanticsLabel,
          TextWidthBasis textWidthBasis,
          TextHeightBehavior textHeightBehavior}) =>
      Text(
        this,
        key: key,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textHeightBehavior: textHeightBehavior,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
      );
}
