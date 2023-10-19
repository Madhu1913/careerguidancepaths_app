import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class doctorSubCategories extends StatefulWidget {
  const doctorSubCategories({super.key});

  @override
  State<doctorSubCategories> createState() => _doctorSubCategoriesState();
}

class _doctorSubCategoriesState extends State<doctorSubCategories> {
  List _docsubcategories = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _docsubcategories = data["subDoc"];
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
        appBar: AppBar(
          title: Text(
            'Doctor',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
          ),
        ),
        body: GridView.builder(
            itemCount: _docsubcategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              mainAxisSpacing: 10,
              //crossAxisSpacing: 10,
               ),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    // height: 40.h,
                    // width: 45.w,
                    color: Colors.amber,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 22.h,
                            child: Card(
                              child: Image.network(
                                _docsubcategories[i]["url"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 11.5.h,
                            width: 45.w,
                            child: Card(
                              child: Center(
                                child: Text(
                                  _docsubcategories[i]["name"],
                                  style: TextStyle(
                                      fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
