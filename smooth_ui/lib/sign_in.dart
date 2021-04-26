import 'package:flutter/material.dart';
import 'package:smooth_ui/constants.dart';
import 'package:smooth_ui/sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.primary,
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 56.0, right: 12.0, left: 12.0, bottom: 26),
          height: size.height,
          width: size.width,
          decoration: Constants.boxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Sign in',
                      style: Constants.heading,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'A world of \npossibility in \nan app',
                    style: Constants.quote,
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Constants.buildTextField('Name'),
              SizedBox(
                height: 10.0,
              ),
              Constants.buildTextField('Password'),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child:
                          Text('Forgot Password', style: Constants.buttonStyle),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      shape: StadiumBorder(),
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Ok',
                              style: TextStyle(
                                color: Constants.primary,
                                fontSize: 18,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward, color: Constants.primary)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Your first time?',
                    style: TextStyle(
                        color: Constants.dull,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text('Sign up', style: Constants.buttonStyle),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
