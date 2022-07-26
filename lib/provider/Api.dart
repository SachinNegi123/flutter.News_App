import 'dart:async';

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ApiResponse with ChangeNotifier {
  Future<void> getNews() async {
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-06-26&sortBy=publishedAt&apiKey=b87884def8464a1ea70262ac110d5a01';

    var response = await http.get(
      url,
    );
    var jsonData = json.decode(response.body);
    print(jsonData);
    return jsonData;
  }

  Future<void> searchNews() async {
    List filterNews = [];
    var query = "";
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-06-26&sortBy=publishedAt&apiKey=b87884def8464a1ea70262ac110d5a01';
    print(url);
    print('hydraaaaaaaaaaa');
    print(query);

    var response = await http.get(
      url,
    );

    var jsonData = json.decode(response.body);
    if (query != null) {
      filterNews = jsonData.where((element) {
        return element['title'].contains(query);
      });

      return filterNews;
    } else if (query == null) {
      return jsonData;
    }
  }
}
