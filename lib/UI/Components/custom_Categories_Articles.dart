import 'package:flutter/material.dart';
import 'package:news_app/models/article_Model.dart';
import 'package:news_app/viewModel/articlesListViewModel.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({this.article});
  ArticleModel? article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Stack(
        children: [
          Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article!.urlToImage.toString()),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )),
          SizedBox(height: 8.0),
          Positioned(
            bottom: 25,
            left: 7,
            right: 10,
            child: Text(
              article!.title.toString(),
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
