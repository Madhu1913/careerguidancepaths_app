import 'dart:convert';

import 'package:careerguidancepaths_app/app/subcategories/DoctorSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/EngineerSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/GovernmentEmploySubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/PoliceSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/SoftwareEngineerSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/TeacherSubCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:oct/app/subcategory.dart';
import 'package:sizer/sizer.dart';

import 'account/accountPage.dart';

class Appdata extends StatefulWidget {
  const Appdata({super.key});

  @override
  State<Appdata> createState() => _AppdataState();
}

class _AppdataState extends State<Appdata> {
  List _categories = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _categories = data["categories"];
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
    List classes = [
      doctorSubCategories(),
      engineerSubCategories(),
      policeSubCategories(),
      teacherSubCategory(),
      softwareEngineerSubCategories(),
      governmentEmploySubCategories()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'Categories',
            style: GoogleFonts.alkatra(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 6.sp, top: 4.sp),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPage()));
              },
              splashColor: Theme.of(context).primaryColorDark,
              icon: Icon(
                Icons.person,
                size: 23.sp,
              ),
              tooltip: 'Profile',
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => classes[i]));
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              height: 70.h,
                              width: 96.w,
                              color: Theme.of(context).primaryColorDark,
                            )),
                        Positioned(
                          left: 15.sp,
                          top: 10.sp,
                          child: Container(
                            color: Colors.white,
                            child: Text(
                              _categories[i]["name"],
                              style: GoogleFonts.zenDots(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.w,
                          top: 40.sp,
                          child: SizedBox(
                            height: 40.h,
                            width: 94.w,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30))),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30)),
                                child: Image.network(
                                  _categories[i]["url"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 1.w,
                            top: 47.h,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                child: Container(
                                  height: 22.h,
                                  width: 94.w,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _categories[i]["desc"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                )))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                )
              ],
            );
          }),
    );
  }
}
