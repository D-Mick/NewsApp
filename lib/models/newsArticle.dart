class NewsArticle{
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({required this.title, required this.description, required this.urlToImage, required this.url});

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
    title: json["title"] == null ? "" : json["title"],
    description: json["description"] == null ? "" : json["description"],
    url: json["url"] == null ? "" : json["url"],
    urlToImage: json["urlToImage"] == null ? "" : json["urlToImage"],
  );
}