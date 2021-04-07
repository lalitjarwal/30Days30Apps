import 'package:fire_git_signin/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';

class GitSignIn extends StatefulWidget {
  @override
  _GitSignInState createState() => _GitSignInState();
}

class _GitSignInState extends State<GitSignIn> {
  Future<UserCredential> signInWithGitHub() async {
    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: 'client ID',
        clientSecret: 'Secret',
        redirectUrl: 'https://my-project.firebaseapp.com/__/auth/handler');

    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);

    // Create a credential from the access token
    final AuthCredential githubAuthCredential =
        GithubAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(githubAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Sign In Demo'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 46.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.black54],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 56.0,
          width: 250,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              var credentials = await signInWithGitHub();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => Home(
                        userCred: credentials,
                      )));
            },
            child: Text(
              'Sign In with Github',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
