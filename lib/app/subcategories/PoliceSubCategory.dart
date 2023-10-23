import 'package:flutter/material.dart';
class policeSubCategories extends StatefulWidget {
  final List polSub;
  const policeSubCategories({super.key,required this.polSub});

  @override
  State<policeSubCategories> createState() => _policeSubCategoriesState();
}

class _policeSubCategoriesState extends State<policeSubCategories> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 003,child: Scaffold(appBar: AppBar(title: Text('Police'),),));
  }
}
