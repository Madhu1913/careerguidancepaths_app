import 'package:flutter/material.dart';
class governmentEmploySubCategories extends StatefulWidget {
  const governmentEmploySubCategories({super.key});

  @override
  State<governmentEmploySubCategories> createState() => _governmentEmploySubCategoriesState();
}

class _governmentEmploySubCategoriesState extends State<governmentEmploySubCategories> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 006,child: Scaffold(appBar: AppBar(title: Text('Government'),),));
  }
}
