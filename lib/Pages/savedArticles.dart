import 'package:flutter/material.dart';

import 'package:news_app/models/article_Model.dart';
import 'package:news_app/provider/saved_articlesProvider.dart';

import 'package:provider/provider.dart';

class SavedArticles extends StatelessWidget {
  ArticleModel? article;
  SavedArticles({super.key, String? categoryName, this.article});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SavedArticlesProvider>(
        create: (context) => SavedArticlesProvider(),
        builder: (context, child) {
          return Scaffold(
            body: Provider.of<SavedArticlesProvider>(context, listen: false)
                    .savedArticles
                    .isEmpty
                ? Center(
                    child: Text('No Items SavedYet'),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: Provider.of<SavedArticlesProvider>(context,
                                listen: false)
                            .savedArticles
                            .length,
                        itemBuilder: (context, index) {
                          ArticleModel article =
                              Provider.of<SavedArticlesProvider>(context,
                                      listen: false)
                                  .savedArticles[index];
                          return ListTile(
                            title: Text(article.title.toString()),
                            subtitle: Text(article.author.toString()),
                          );
                        }),
                  ),
          );
        });
  }
}
