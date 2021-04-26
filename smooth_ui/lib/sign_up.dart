import 'package:flutter/material.dart';
import 'package:smooth_ui/constants.dart';
import 'package:smooth_ui/sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dobController = TextEditingController();
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
                      'Sign up',
                      style: Constants.heading,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'We can start \nsomething \nnew',
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
              Constants.buildTextField('Email'),
              SizedBox(
                height: 10.0,
              ),
              Constants.buildTextField('Password'),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 56.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Birth',
                      style: TextStyle(
                          color: Constants.dull,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    SizedBox(
                        width: 150,
                        child: TextField(
                          onTap: () async {
                            var dob = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2001),
                                firstDate: DateTime(1990),
                                lastDate: DateTime.now());
                            dobController.text =
                                '${dob.day} ' + '${dob.month} ' + '${dob.year}';
                          },
                          controller: dobController,
                          readOnly: true,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              suffixIcon:
                                  InkWell(child: Icon(Icons.arrow_drop_down)),
                              border: InputBorder.none,
                              hintText: '01 01 1999',
                              hintStyle: TextStyle(
                                  color: Constants.dull,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2)),
                        ))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {},
                  shape: StadiumBorder(),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward, color: Constants.primary)
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Have we met before?',
                    style: TextStyle(
                        color: Constants.dull,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text('Sign in', style: Constants.buttonStyle),
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
