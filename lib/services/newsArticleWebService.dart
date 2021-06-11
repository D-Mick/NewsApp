import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/newsArticle.dart';

abstract class NewsArticleWebService {
  Future<List<NewsArticle>?> searchNews(String query);
  Future<List<NewsArticle>?> latestNews();
}

class WebService implements NewsArticleWebService {
  String baseURL = 'newsapi.org';
  final String apiKey = '819adfe241894b9ea1535f8b8760ba06';

  @override
  Future<List<NewsArticle>?> searchNews(String query) async {
    String path = 'v2/everything';
    var queryParams = {"q": "$query", "apiKey": "$apiKey"};

    Uri uri = Uri.https(baseURL, path, queryParams);

    try {
      var response = await http.get(uri);
      print(response.request!.url);
      print(response.body);
      if (response.statusCode == 200) {
        List news = jsonDecode(response.body)['articles'];

        return news.map((article) => NewsArticle.fromJson(article)).toList();
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future<List<NewsArticle>?> latestNews() async {
    String path = 'v2/top-headlines';
    var queryParams = {"country": "us", "apiKey": "$apiKey"};
    Uri uri = Uri.https(baseURL, path, queryParams);
    try {
      var response = await http.get(uri);
      print(response.request!.url);
      print(response.body);
      if (response.statusCode == 200) {
        List news = jsonDecode(response.body)['articles'];

        var x = news.map((article) => NewsArticle.fromJson(article)).toList();

        return x;
      }
    } on Exception catch (e) {
      print(e);

    }
  }

}
