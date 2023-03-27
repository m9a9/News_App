import 'package:flutter/material.dart';
import 'package:news_app/models/article_Model.dart';

class SavedArticlesProvider extends ChangeNotifier {
  List<ArticleModel> _savedArticles = [];
  List<ArticleModel> get savedArticles => _savedArticles;

  void addArticles(ArticleModel article) {
    _savedArticles.add(article);
    notifyListeners();
  }
}
