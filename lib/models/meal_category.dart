import 'package:flutter/material.dart';

class MealCategory {
  final String id;
  final String title;
  final Color bgColor;

  const MealCategory({@required this.id, @required this.title, this.bgColor = Colors.orange});
}
