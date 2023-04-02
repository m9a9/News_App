import 'package:flutter/material.dart';
import 'package:news_app/UI/Components/custom_Categories_Articles.dart';

import 'package:news_app/models/article_Model.dart';
import 'package:news_app/provider/saved_articlesProvider.dart';
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
    int index = favItems.length;
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
              return customListTile(
                favItems[index],
              );
            }),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepOrange,
        ),
        child: IconButton(
            onPressed: () {
              favItemProvider.removeArticleFromFav(favItems[index]);
            },
            icon: Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
            )),
      ),
    );
  }
}
