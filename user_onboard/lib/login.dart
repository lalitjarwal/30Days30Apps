
import 'package:flutter/material.dart';
import 'package:user_onboard/home.dart';
import 'package:user_onboard/register.dart';
import 'package:user_onboard/storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _controllerPhone = TextEditingController();
  final _controllerPass = TextEditingController();
  @override
  void dispose() {
    _controllerPass.clear();
    _controllerPhone.clear();
    _controllerPass.dispose();
    _controllerPhone.dispose();
    super.dispose();
  }

  final storage = Storage();
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Phone number is required*';
                      else
                        return null;
                    },
                    style: TextStyle(
                      fontSize: 18,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    keyboardType: TextInputType.number,
                    controller: _controllerPhone,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 22),
                        hintText: 'Enter Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Password is required';
                      else
                        return null;
                    },
                    controller: _controllerPass,
                    style: TextStyle(
                      fontSize: 18,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    obscureText: showPass,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            splashRadius: 1,
                            tooltip: 'Show Passsword',
                            icon: Icon(showPass? Icons.visibility_rounded:Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            }),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 22),
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(StadiumBorder()),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.purple)),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (await storage.check(
                                _controllerPhone.text, _controllerPass.text)) {
                              storage.setLogin();
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                            } else
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Could not find a account!'),
                              ));
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        )),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('New User?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegistrationScreen()));
                        },
                        child: Text(
                          'Sign UP',
                          textScaleFactor: 1.2,
                        ),
                       
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}