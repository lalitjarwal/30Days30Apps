import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DescriptionPage extends StatelessWidget {
  static String tag = 'description-page';
  DescriptionPage(this.urlnews);
  final String urlnews;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Full Article",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: WebviewScaffold(
        url: urlnews,
        initialChild: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
