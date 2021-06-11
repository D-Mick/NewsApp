import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/services/newsArticleWebService.dart';

enum LoadingStatus{
  completed,
  searching,
  empty
}

class NewsArticleListViewModel extends ChangeNotifier{
  var loadingStatus = LoadingStatus.searching;
  List<NewsArticle> articles =[];

  Future<void> searchNews(String value) async{
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle>? newsArticles = await WebService().searchNews(value);
    this.articles = newsArticles!;
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> TopHeadLines() async{
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle>? newsArticles = await WebService().latestNews();
    this.articles = newsArticles!;
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  int get articleLength => articles.length;
}