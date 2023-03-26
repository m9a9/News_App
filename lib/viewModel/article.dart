import 'package:news_app/models/article_Model.dart';

class ArticleViewModel {
  ArticleModel? articleModel;
  ArticleViewModel({this.articleModel});

  get title => articleModel?.title;
  get content => articleModel?.content;

  get description => articleModel?.description;

  get url => articleModel?.url;

  get urlToImage => articleModel?.urlToImage;

  get publishedAt => articleModel?.publishedAt;
  get author => articleModel?.author;
}
