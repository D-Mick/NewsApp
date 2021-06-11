import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticle.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailWidget extends StatefulWidget {
  final NewsArticle article;

  NewsArticleDetailWidget({required this.article});

  @override
  _NewsArticleDetailWidgetState createState() => _NewsArticleDetailWidgetState();
}

class _NewsArticleDetailWidgetState extends State<NewsArticleDetailWidget> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.widget.article.title}"),
      ),
      body: WebView(
        initialUrl: this.widget.article.url,
      )
    );
  }
}
