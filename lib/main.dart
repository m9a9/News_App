// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/UI/Pages/article_Details.dart';
import 'package:news_app/UI/Pages/categoriesPage.dart';

import 'package:news_app/UI/Pages/homePage.dart';
import 'package:news_app/viewModel/articlesListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.deepOrange),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.deepOrange)),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<ArticlesListViewModel>(
          create: (context) => ArticlesListViewModel(),
        ),
      ], child: HomePage()),
    );
  }
}
