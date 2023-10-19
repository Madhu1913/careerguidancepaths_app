import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class doctorSubCategories extends StatefulWidget {
  const doctorSubCategories({super.key});

  @override
  State<doctorSubCategories> createState() => _doctorSubCategoriesState();
}

class _doctorSubCategoriesState extends State<doctorSubCategories> {
  List _subcategories = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _subcategories = data["subDoc"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 001,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Text(
          _subcategories[0]["name"],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        )),
      ),
    );
  }
}
