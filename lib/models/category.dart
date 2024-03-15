import 'package:flutter/material.dart';

class Category {
  Category(
      {required this.id,
      required this.title,
      this.color = const Color.fromARGB(228, 225, 123, 13)});
  final String id;
  final String title;
  final Color color;
}
