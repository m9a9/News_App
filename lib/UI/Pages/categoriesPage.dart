// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/Components/customCategory_field.dart';
import 'package:news_app/Pages/newsByCategoryType.dart';
import 'package:news_app/Pages/savedArticles.dart';
import 'package:news_app/main.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: GridView(
            scrollDirection: Axis.vertical,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              CustomCategoryFields(
                  color: Colors.greenAccent,
                  categoryName: 'Health',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsByCategoryType(
                                  categoryType: 'health',
                                )));
                  }),
              CustomCategoryFields(
                  color: Colors.redAccent,
                  categoryName: 'Sports',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsByCategoryType(
                                  categoryType: 'sports',
                                )));
                  }),
              CustomCategoryFields(
                  color: Colors.amber,
                  categoryName: 'Science',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsByCategoryType(
                                  categoryType: 'science',
                                )));
                  }),
              CustomCategoryFields(
                  color: Colors.purpleAccent,
                  categoryName: 'General ',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsByCategoryType(
                                  categoryType: 'general',
                                )));
                  }),
              CustomCategoryFields(
                  color: Colors.grey,
                  categoryName: 'Technolgy',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsByCategoryType(
                                  categoryType: 'technology',
                                )));
                  }),
              CustomCategoryFields(
                  color: Colors.greenAccent,
                  categoryName: 'Business',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsByCategoryType(
                                  categoryType: 'business',
                                )));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
