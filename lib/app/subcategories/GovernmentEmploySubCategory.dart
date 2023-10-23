import 'package:flutter/material.dart';
class governmentEmploySubCategories extends StatefulWidget {
  final List govEmpSub;
  const governmentEmploySubCategories({super.key,required this.govEmpSub});

  @override
  State<governmentEmploySubCategories> createState() => _governmentEmploySubCategoriesState();
}

class _governmentEmploySubCategoriesState extends State<governmentEmploySubCategories> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 006,child: Scaffold(appBar: AppBar(title: Text('Government'),),));
  }
}
