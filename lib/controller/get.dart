import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/model/news_item.dart';
import 'package:http/http.dart' as http;

class Getd {
  final dio = Dio();

  Future<List<NewsItem>> getnews(String cat) async {
    final String path =
        'https://api.collectapi.com/news/getNews?country=tr&tag=$cat';
    Response response = await dio.get(
      path,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${apikeynews}',
        },
      ),
    );

    List<dynamic> jsondata = response.data['result'];
    List<NewsItem> news =
        jsondata.map((e) {
          return NewsItem(
            key: e['key'],
            url: e['url'],
            description: e['description'],
            image: e['image'],
            name: e['name'],
            source: e['source'],
            date: DateTime.parse(e['date']),
          );
        }).toList();
    return news;
  }

  Future<List<dynamic>> fetchusers() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=mersin',
        ),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'apikey 0cFf61NxNpeEL503h6QxXF:2qZL2FNKkBK1HKudkafaHa',
        },
      );
      final body = response.body;
      final json = jsonDecode(body);

      log(json.toString());

      return json['result'];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> namaz() async {
    final response = await http.get(
      Uri.parse('https://api.collectapi.com/pray/all?data.city=istanbul'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'apikey 0cFf61NxNpeEL503h6QxXF:2qZL2FNKkBK1HKudkafaHa',
      },
    );

    final body = response.body;
    final json = jsonDecode(body);

    return json['result'];
  }
}
