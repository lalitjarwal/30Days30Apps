import 'package:flutter/material.dart';
import 'package:hero/model.dart';

class Detail extends StatelessWidget {
  const Detail({Key key,@required this.wonder,@required this.index}) : super(key: key);
  final Wonder wonder;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
            tag: 'title' + '$index',
            child: Material(
                type: MaterialType.transparency,
                child: Text(
                  wonder.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                ))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(tag: 'img' + '$index', child: Image.network(wonder.imgUrl)),
              Hero(
                tag: 'place' + '$index',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    wonder.place,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 4,
                margin: EdgeInsets.all(4),
                color: Colors.blueGrey,
              ),
              Hero(
                tag: 'desc' + '$index',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    wonder.description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
