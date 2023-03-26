// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/Pages/article_Details.dart';
import 'package:news_app/Pages/categoriesPage.dart';

import 'package:news_app/Pages/homePage.dart';

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
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ArticlesListViewModel>(
          create: (context) => ArticlesListViewModel(), child: HomePage()),
    );
  }
}
