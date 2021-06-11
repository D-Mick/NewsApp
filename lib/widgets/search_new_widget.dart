import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleListViewModels.dart';
import 'package:provider/provider.dart';

class SearchNewsWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsArticleListViewModel>(
      builder: (context, article, _) {
        return Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: TextField(
            controller: textEditingController,
            autocorrect: true,
            onSubmitted: (value){
              if(value.isNotEmpty){
                article.searchNews(value);
              }
            },
            decoration: InputDecoration(
              labelText: 'Search',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => textEditingController.clear(),
              ),
            ),
          ),
        );
      },
    );
  }
}
