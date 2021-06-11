import 'package:flutter/material.dart';
import 'package:news_app/screens/news_list_screen.dart';
import 'package:news_app/viewmodels/newsArticleListViewModels.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsArticleListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "New App",
        home: NewsListScreen(),
      ),
    );
  }
}


