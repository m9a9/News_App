// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/UI/Pages/article_Details.dart';
import 'package:news_app/UI/Pages/savedArticles.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/models/article_Model.dart';
import 'package:news_app/viewModel/articlesListViewModel.dart';
import 'package:provider/provider.dart';

class BreakingNews extends StatelessWidget {
  BreakingNews({super.key});
  NewsService client = NewsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getAllnews(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ArticleModel> newsList = snapshot.data;
          return Container(
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlesDetailsPage(
                                  newsdata: newsList[index],
                                  context: context,
                                )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width - 90,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(
                              newsList[index].urlToImage.toString()),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Color.fromARGB(230, 0, 0, 0).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width - 40,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 33, left: 4),
                            child: Text(
                              newsList[index].title.toString(),
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 4,
                          child: Row(
                            children: [
                              Text(
                                newsList[index].author.toString(),
                                textScaleFactor: 0.9,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                newsList[index].publishedAt.toString(),
                                textScaleFactor: 0.8,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(95, 20, 0, 29)),
                            child: IconButton(
                                onPressed: () {
                                  final savedItem =
                                      Provider.of<ArticlesListViewModel>(
                                          context,
                                          listen: false);
                                  savedItem.addArticlestoFav(newsList[index]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Article saved'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.bookmark_add,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
