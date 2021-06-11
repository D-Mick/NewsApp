import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/viewmodels/newsArticleListViewModels.dart';
import 'package:news_app/widgets/news_article_detail_widget.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  
  void _showNewsArticleDetails(BuildContext context, NewsArticle article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailWidget(article: article),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsArticleListViewModel>(
      builder: (context, article, _) {
        return ListView.builder(
          itemCount: article.articleLength,
          itemBuilder: (context, index) {
            final articles = article.articles[index];
            return ListTile(
              onTap: () {
                _showNewsArticleDetails(context, articles);
              },
              leading: FadeInImage(
                height: 100,
                width: 100,
                placeholder: AssetImage('images/snip.png'),
                image: NetworkImage(articles.urlToImage),
              ),
              title: Text(articles.title),
            );
          },
        );
      },
    );
  }
}
