import 'package:flutter/material.dart';
import 'package:hero/details.dart';
import 'package:hero/model.dart';
import 'package:hero/wonders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: '7 Wonders',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('7 Wonders of the World'),
      ),
      body: ListView.builder(
          itemCount: wonders.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Hero(
                  tag: 'title' + '$index',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      wonders[index].title,
                    ),
                  ),
                ),
                leading: Hero(
                  tag: 'img' + '$index',
                  child: Image.network(
                    wonders[index].imgUrl,
                    width: 50.0,
                  ),
                ),
                subtitle: Hero(
                  tag: 'desc' + '$index',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      wonders[index].description,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                trailing: Hero(
                  tag: 'place' + '$index',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      wonders[index].place,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                onTap: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 600),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Detail(
                        wonder: wonders[index],
                        index: index,
                      );
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return Align(
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}
