import 'package:flutter/material.dart';
class teacherSubCategory extends StatefulWidget {
  final List tecSub;
  const teacherSubCategory({super.key,required this.tecSub});

  @override
  State<teacherSubCategory> createState() => _teacherSubCategoryState();
}

class _teacherSubCategoryState extends State<teacherSubCategory> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 004,child: Scaffold(appBar: AppBar(title: Text('Teacher'),),));
  }
}
