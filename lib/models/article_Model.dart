// ignore_for_file: file_names

class ArticleModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  ArticleModel(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.title,
      this.url,
      this.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> jsondData) {
    return ArticleModel(
      author: jsondData['author'] != null
          ? jsondData['author'] as String
          : 'Author null',
      title: jsondData['title'] != null
          ? jsondData['title'] as String
          : 'title null',
      description: jsondData['description'] != null
          ? jsondData['description'] as String
          : 'description null',
      url: jsondData['url'] != null
          ? jsondData['url'] as String
          : "https://www.foxnews.com/world/kyiv-rocked-explosions-week-after-russian-strikes-across-ukraine",
      urlToImage: jsondData['urlToImage'] != null
          ? jsondData['urlToImage'] as String
          : "https://images.unsplash.com/photo-1665931500523-98ae696c47f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      publishedAt: jsondData['publishedAt'] != null
          ? jsondData['publishedAt'] as String
          : 'null',
      content: jsondData['content'] != null
          ? jsondData['content'] as String
          : 'ther is no content here',
    );
  }
}
