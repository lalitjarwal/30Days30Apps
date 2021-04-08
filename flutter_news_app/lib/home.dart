import 'package:flutter/material.dart';
import 'package:flutter_news_app/newsfeeds.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: width,
              color: Colors.white,
              child: Center(
                  child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: <Widget>[
                  Card(
                      elevation: 3.0,
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/business.jpg'),
                                  fit: BoxFit.fill)),
                          child: Container(
                            color: Colors.black.withOpacity(0.4),
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Business Headlines",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          var id = 1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NewsFeedPage(id),
                              ));
                        },
                      )),
                  Card(
                      elevation: 3.0,
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/bitcoins.jpg"),
                                  fit: BoxFit.fill)),
                          child: Container(
                            color: Colors.black.withOpacity(0.4),
                            padding: EdgeInsets.all(8.0),
                            child: Text("Bitcoin",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        onTap: () {
                          var id = 2;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NewsFeedPage(id),
                              ));
                        },
                      )),
                  Card(
                      elevation: 3.0,
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/tc.png"),
                                  fit: BoxFit.fill)),
                          child: Container(
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.4),
                            padding: EdgeInsets.all(8.0),
                            child: Text("TechCrunch",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        onTap: () {
                          var id = 3;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NewsFeedPage(id),
                              ));
                        },
                      )),
                  Card(
                    elevation: 3.0,
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                                image: AssetImage("assets/images/apple.jpg"),
                                fit: BoxFit.fill)),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                          padding: EdgeInsets.all(8.0),
                          child: Text("Apple from Yesterday",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      onTap: () {
                        var id = 4;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NewsFeedPage(id),
                            ));
                      },
                    ),
                  ),
                  Card(
                      elevation: 3.0,
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/wsj.jpeg"),
                                  fit: BoxFit.fill)),
                          child: Container(
                            color: Colors.black.withOpacity(0.4),
                            padding: EdgeInsets.all(8.0),
                            child: Text("Wall Street Journal",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        onTap: () {
                          var id = 5;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NewsFeedPage(id),
                              ));
                        },
                      )),
                ],
              )),
            ),
          ),
        ],
      )),
    );
  }
}
