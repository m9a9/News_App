import 'package:news_app/models/article_Model.dart';

class ListOfArticlesModel {
  List<dynamic>? articles;
  ListOfArticlesModel({this.articles});

  factory ListOfArticlesModel.fromJson(Map<String, dynamic> jsonData) {
    return ListOfArticlesModel(articles: jsonData['articles']);
  }
}
