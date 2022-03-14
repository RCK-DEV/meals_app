import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final Category category;

  const CategoriesMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(category.title)),
        body: Container(
          child: Text('CategoriesMealsScreen'),
        ));
  }
}
