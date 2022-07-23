import 'dart:async';

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../Models/article_model.dart';

class ApiResponse with ChangeNotifier {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-06-23&sortBy=publishedAt&apiKey=b87884def8464a1ea70262ac110d5a01';

    var response = await http.get(
      url,
    );
    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );

        news.add(articleModel);
      });
    }
    return jsonData;
  }
}
