import 'package:flutter/material.dart';
class engineerSubCategories extends StatefulWidget {
  final List engSub;
  const engineerSubCategories({super.key,required this.engSub});

  @override
  State<engineerSubCategories> createState() => _engineerSubCategoriesState();
}

class _engineerSubCategoriesState extends State<engineerSubCategories> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 002,child: Scaffold(appBar: AppBar(title: Text('Engineer'),),));
  }
}
