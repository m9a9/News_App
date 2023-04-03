import 'package:flutter/material.dart';
import 'package:news_app/UI/Components/custom_Categories_Articles.dart';
import 'package:news_app/UI/Pages/article_Details.dart';

import 'package:news_app/models/article_Model.dart';
import 'package:news_app/viewModel/articlesListViewModel.dart';

import 'package:provider/provider.dart';

class SavedArticles extends StatelessWidget {
  ArticleModel? article;
  SavedArticles({super.key, String? categoryName, this.article});

  @override
  Widget build(BuildContext context) {
    final favItemProvider =
        Provider.of<ArticlesListViewModel>(context, listen: false);
    final favItems = favItemProvider.favList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: favItems.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticlesDetailsPage(
                                newsdata: favItems[index],
                              )));
                },
                child: CustomListTile(
                  article: favItems[index],
                ),
              );
            }),
      ),
    );
  }
}
