import 'package:flutter/material.dart';
class teacherSubCategory extends StatefulWidget {
  const teacherSubCategory({super.key});

  @override
  State<teacherSubCategory> createState() => _teacherSubCategoryState();
}

class _teacherSubCategoryState extends State<teacherSubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Teacher'),),);
  }
}
