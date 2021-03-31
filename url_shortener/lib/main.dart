import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showBusy = false;

  final TextEditingController _controller = TextEditingController();

  final requestURL = 'https://cleanuri.com/api/v1/shorten';

  Future<String> shortURL() async {
    var longURL = _controller.text;
    try {
      var response =
          await http.post(Uri.parse(requestURL), body: {"url": longURL});
      _controller.text = "";
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      setState(() {
        showBusy = false;
      });
      return data['result_url'];
    } catch (exception) {
      print(exception);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Shortener'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            setState(() {
              showBusy = true;
            });
            var link = await shortURL();
            print(link);
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Short Url'),
                  content: Text('$link'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: '$link'));
                          Navigator.of(context).pop();
                        },
                        child: Text('Copy'))
                  ],
                );
              },
            );
          },
          label: Text('Short')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.yellow, Colors.green])),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter your Url here'),
              ),
            ),
          ),
          showBusy
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey.withOpacity(0.6),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
