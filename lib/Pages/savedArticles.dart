import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SavedArticles extends StatelessWidget {
  SavedArticles({super.key, String? categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 44, 33, 1),
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }
}
