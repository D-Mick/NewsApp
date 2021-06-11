import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleListViewModels.dart';
import 'package:news_app/widgets/news_list_widget.dart';
import 'package:news_app/widgets/search_new_widget.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .TopHeadLines();
  }

  Widget _buildList(NewsArticleListViewModel nalvm) {
    switch (nalvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.empty:
        return Center(
          child: Text("No Result Found!"),
        );
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsArticleListViewModel>(
      builder: (context, article, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Latest News"),
          ),
          body: Column(
            children: [
              SearchNewsWidget(),
              _buildList(article),
            ],
          ),
        );
      },
    );
  }
}
