// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/Components/custom_Categories_Articles.dart';
import 'package:news_app/Pages/article_Details.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/models/article_Model.dart';

class NewsByCategoryType extends StatelessWidget {
  String? categoryType;
  NewsByCategoryType({this.categoryType});
  NewsService client = NewsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryType.toString()),
      ),
      body: FutureBuilder(
          future: client.getNewsByCategory(categoryType.toString()),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<ArticleModel> newsData = snapshot.data;
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: newsData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArticlesDetailsPage(
                                          newsdata: newsData[index],
                                          context: context,
                                        )));
                          },
                          child: customListTile(newsData[index]));
                    }),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
