// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/Pages/article_Details.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/models/article_Model.dart';

class ExploringComponent extends StatelessWidget {
  ExploringComponent({super.key});
  NewsService client = NewsService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: client.getNewsByCategory('Sports'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<ArticleModel> articleData = snapshot.data;
            return Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 1.4,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticlesDetailsPage(
                                      context: context,
                                      newsdata: articleData[index],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(234, 194, 237, 243),
                        ),
                        child: Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(articleData[index]
                                            .urlToImage
                                            .toString()),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                        color: Colors.amberAccent,
                                        child: Text(
                                          'Exclusive',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Text(
                                      articleData[index].title.toString(),
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    articleData[index].author == null
                                        ? Text(articleData[index]
                                            .publishedAt
                                            .toString())
                                        : Text(articleData[index]
                                            .author
                                            .toString()),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
