import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.userCred}) : super(key: key);
  final UserCredential userCred;
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
              radius: 60,
              backgroundImage: NetworkImage('${userCred.user.photoURL}'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Name: ${userCred.user.displayName}'),
            SizedBox(
              height: 20.0,
            ),
            Text('Email: ${userCred.user.email}')
          ],
        ),
      ),
    );
  }
}
