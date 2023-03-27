import 'package:flutter/material.dart';
import 'package:news_app/Components/custom_Categories_Articles.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/models/article_Model.dart';
import 'package:news_app/viewModel/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesListViewModel with ChangeNotifier {
  List<ArticleModel> _articlesList = [];
  List<ArticleModel> _articlesModelByCategory = [];

  List<ArticleModel> get articlesList => _articlesList;
  List<ArticleModel> get ariclesListByCategory => _articlesModelByCategory;

  Future<void> fetchNews() async {
    _articlesList = await NewsService().getAllnews();
    notifyListeners();
  }

  Future fetchNewsByCategory(String categoy) async {
    _articlesModelByCategory = await NewsService().getNewsByCategory(categoy);
    notifyListeners();
  }

  void openUrl(Uri url) async {
    await launchUrl(url);
    notifyListeners();
  }
}
