import 'package:fire_google_signin/appmethods.dart';
import 'package:fire_google_signin/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GSignIn extends StatelessWidget {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign In Demo'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 46.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 56.0,
          width: 250,
          child: ElevatedButton(
            onPressed: () async {
              AppMethods.showBusy(context, true);
              UserCredential credentials = await signInWithGoogle();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Home(userCred: credentials,)));
            },
            child: Text('Sign In with Google',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
