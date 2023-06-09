// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app/UI/Components/breaking_News.dart';
import 'package:news_app/UI/Pages/NewsPage.dart';
import 'package:news_app/UI/Pages/categoriesPage.dart';
import 'package:news_app/UI/Pages/savedArticles.dart';

import '../Components/exploring .dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  List pages = [NewsPage(), CategoriesPage(), SavedArticles()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8FA),
      appBar: AppBar(
        backgroundColor: Color(0xffF6F8FA),
        title: Text(
          'TOP NEWS',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.black)),
        ],
        elevation: 0,
      ),
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          currentIndex: _pageIndex,
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Saved'),
          ]),
    );
  }
}
