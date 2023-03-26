import 'dart:convert';

import 'package:news_app/models/article_Model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = '6621bc74b7b340128168d98437346241';

  Future<List<ArticleModel>> getAllnews() async {
    try {
      Uri url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> articlesList = data['articles'];
        List<ArticleModel> articles =
            articlesList.map((item) => ArticleModel.fromJson(item)).toList();
        return articles;
      } else {
        print('your response StatusCode is ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
    throw Exception("Something went Wrong");
  }

  Future<List<ArticleModel>> getNewsByCategory(String category) async {
    try {
      Uri url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        http.Response response = await http.get(url);
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> articlesList = data['articles'];
        List<ArticleModel> articles =
            articlesList.map((item) => ArticleModel.fromJson(item)).toList();
        return articles;
      } else {
        print('your response StatusCode is ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
    throw Exception("Something went Wrong");
  }
}
