import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  // final Category category;
  // const CategoriesMealsScreen(this.category);
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category =
        (ModalRoute.of(context).settings.arguments as Map<String, Category>)['category'];

    return Scaffold(
        appBar: AppBar(title: Text(category.title)),
        body: Container(
          child: Text('CategoriesMealsScreen'),
        ));
  }
}
