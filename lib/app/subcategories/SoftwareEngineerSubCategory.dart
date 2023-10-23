import 'package:flutter/material.dart';
class softwareEngineerSubCategories extends StatefulWidget {
  final List sofEngSub;
  const softwareEngineerSubCategories({super.key,required this.sofEngSub});

  @override
  State<softwareEngineerSubCategories> createState() => _softwareEngineerSubCategoriesState();
}

class _softwareEngineerSubCategoriesState extends State<softwareEngineerSubCategories> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 005,child: Scaffold(appBar: AppBar(title: Text('Software'),),));
  }
}
