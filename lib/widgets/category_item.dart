import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return CategoriesMealsScreen(category);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [category.bgColor.withOpacity(.7), category.bgColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
