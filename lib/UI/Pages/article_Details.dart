// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/UI/Pages/homePage.dart';
import 'package:news_app/models/article_Model.dart';
import 'package:news_app/viewModel/articlesListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesDetailsPage extends StatelessWidget {
  ArticlesDetailsPage({
    this.newsdata,
    BuildContext? context,
  });

  ArticleModel? newsdata;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context) => ArticlesListViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 22, 77), shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            newsdata!.urlToImage.toString(),
                          ),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.5),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.85,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 12),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                newsdata!.title.toString(),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              newsdata!.description.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              newsdata!.content.toString(),
                              maxLines: 10,
                              textScaleFactor: 1.5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Provider.of<ArticlesListViewModel>(context,
                                        listen: false)
                                    .openUrl(
                                        (Uri.parse(newsdata!.url.toString())));
                              },
                              child: Text(
                                newsdata!.url.toString(),
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
