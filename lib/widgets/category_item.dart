import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
