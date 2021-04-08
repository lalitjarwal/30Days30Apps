import 'package:flutter/material.dart';
import 'package:flutter_news_app/constants.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'description.dart';

class NewsFeedPage extends StatelessWidget {
  static String tag = "NewsFeedPage-tag";
  NewsFeedPage(this.text);
  final int text;

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String title;
    if (text == 1) {
      title = "Bussiness";
    } else if (text == 2) {
      title = "Bitcoin";
    } else if (text == 3) {
      title = "TechCrunch";
    } else if (text == 4) {
      title = "Apple";
    } else if (text == 5) {
      title = "Well Street";
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text("$title Headlines",
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:  SafeArea(
          child: Column(
        children: [
         Expanded(
            flex: 1,
            child: Container(
                width: width,
                color: Colors.white,
                child: GestureDetector(
                  child: FutureBuilder<List<News>>(
                    future: fatchNews(
                        http.Client(), text), // a Future<String> or null
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? NewsList(news: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                )),
          ),
        ],
      )),
    );
  }
}

Future<List<News>> fatchNews(http.Client client, id) async {
  String url;
  if (id == 1) {
    url = Constant.base_url +
        "top-headlines?country=in&category=business&apiKey=" +
        Constant.key;
  } else if (id == 2) {
    url = Constant.base_url +
        "everything?q=bitcoin&sortBy=publishedAt&apiKey=" +
        Constant.key;
  } else if (id == 3) {
    url = Constant.base_url +
        "top-headlines?sources=techcrunch&apiKey=" +
        Constant.key;
  } else if (id == 4) {
    url = Constant.base_url +
        "everything?q=apple&from=2018-07-14&to=2018-07-14&sortBy=popularity&apiKey=" +
        Constant.key;
  } else if (id == 5) {
    url =
        Constant.base_url + "everything?domains=wsj.com&apiKey=" + Constant.key;
  }
  final response = await client.get(Uri.parse(url));
  return compute(parsenews, response.body);
}

List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody);
  return (parsed["articles"] as List)
      .map<News>((json) => new News.fromJson(json))
      .toList();
}

class News {
  String auther;
  String title;
  String description;
  String url;

  News({this.auther, this.title, this.description, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return  Card(
          child:  ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
              backgroundColor: Colors.lightBlue,
            ),
            title: Text(news[index].title),
            onTap: () {
              var url = news[index].url;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  DescriptionPage(url),
                  ));
            },
          ),
        );
      },
    );
  }
}
