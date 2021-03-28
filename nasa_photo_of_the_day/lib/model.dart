import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

Future<NASAPod> fetchData() async {
  final response = await get(Uri.parse(
      'https://api.nasa.gov/planetary/apod?api_key=GwXKTEtJ4ghAyPglOiPz4PAWp3gYkiPG8oc2DdTQ'));
  if (response.statusCode == 200) {
    //print(json.decode(response.body));
    return NASAPod.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed');
  }
}

// https://api.nasa.gov/planetary/apod?api_key=GwXKTEtJ4ghAyPglOiPz4PAWp3gYkiPG8oc2DdTQ

class NASAPod {
  final String date;
  final String explaination;
  final String hdurl;
  final String title;
  final String url;

  NASAPod({
    this.date,
    this.hdurl,
    this.title,
    this.explaination,
    this.url,
  });

@override
String toString() {
  return "${this.date},${this.hdurl},${this.title},${this.explaination},${this.url},";
 }
  factory NASAPod.fromJson(Map<String, dynamic> json) => NASAPod(
        date: json['date'] ?? '',
        hdurl: json['hdurl'] ?? '',
        title: json['title'] ?? '',
        url: json['url'] ?? '',
        explaination: json['explanation'] ?? '',
      );
}
