import 'package:flutter/material.dart';
class policeSubCategories extends StatefulWidget {
  const policeSubCategories({super.key});

  @override
  State<policeSubCategories> createState() => _policeSubCategoriesState();
}

class _policeSubCategoriesState extends State<policeSubCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Police'),),);
  }
}
