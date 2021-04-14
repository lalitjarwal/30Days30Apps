import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Login Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var cred = await signInWithFacebook();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home(
                          cred: cred,
                        )));
          },
          child: Text('Login With Facebook'),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key, this.cred}) : super(key: key);
  final UserCredential cred;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(cred.user.photoURL),
            ),
            Text(cred.user.displayName)
          ],
        ),
      ),
    );
  }
}
