import 'dart:convert';
import 'package:careerguidancepaths_app/app/subcategories/AirHostress.dart';
import 'package:careerguidancepaths_app/app/subcategories/Archeologist.dart';
import 'package:careerguidancepaths_app/app/subcategories/Astrounaut.dart';
import 'package:careerguidancepaths_app/app/subcategories/BankEmployee.dart';
import 'package:careerguidancepaths_app/app/subcategories/Chef.dart';
import 'package:careerguidancepaths_app/app/subcategories/EventManager.dart';
import 'package:careerguidancepaths_app/app/subcategories/FashionDesigner.dart';
import 'package:careerguidancepaths_app/app/subcategories/Ias.dart';
import 'package:careerguidancepaths_app/app/subcategories/Ips.dart';
import 'package:careerguidancepaths_app/app/subcategories/Judge.dart';
import 'package:careerguidancepaths_app/app/subcategories/Lawyer.dart';
import 'package:careerguidancepaths_app/app/subcategories/Librarian.dart';
import 'package:careerguidancepaths_app/app/subcategories/LocoPilot.dart';
import 'package:careerguidancepaths_app/app/subcategories/Pilot.dart';
import 'package:careerguidancepaths_app/app/subcategories/SportsCoach.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:careerguidancepaths_app/app/subcategories/DoctorSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/EngineerSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/GovernmentEmploySubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/PoliceSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/SoftwareEngineerSubCategory.dart';
import 'package:careerguidancepaths_app/app/subcategories/TeacherSubCategory.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List _categories = [];
  List _docsub = [];
  List _engSub = [];
  List _polSub = [];
  List _tecSub = [];
  List _sofEngSub = [];
  List _govEmpSub = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _categories = data["categories"];
      _docsub = data["subDoc"];
      _engSub = data["subEng"];
      _polSub = data["subPol"];
      _tecSub = data["subTec"];
      _sofEngSub = data["subSofEng"];
      _govEmpSub = data["subGovEmp"];
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
      doctorSubCategories(
        docSub: _docsub,
      ),
      engineerSubCategories(
        engSub: _engSub,
      ),
      policeSubCategories(
        polSub: _polSub,
      ),
      teacherSubCategory(
        tecSub: _tecSub,
      ),
      softwareEngineerSubCategories(
        sofEngSub: _sofEngSub,
      ),
      governmentEmploySubCategories(
        govEmpSub: _govEmpSub,
      ),
      lawyer(),
      judge(),
      pilot(),
      locoPilot(),
      bankEmployee(),
      airHosters(),
      ias(),
      ips(),
      chef(),
      sportsCoach(),
      astrounaut(),
      archeologist(),
      fashionDesigner(),
      eventManager(),
      librarian()
    ];
    List tags = [
      001,
      002,
      003,
      004,
      005,
      006,
      007,
      008,
      009,
      010,
      011,
      012,
      013,
      014,
      015,
      016,
      017,
      018,
      019,
      020,
      021
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: GoogleFonts.varela(
              fontSize: 26.sp, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
                          child: Hero(
                              tag: tags[i],
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                    width: 96.w,
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 20.sp,
                                      shadowColor: Colors.purple,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side: const BorderSide(
                                              color: Colors.black, width: 2)),
                                    ),
                                  ),
                                  Positioned(
                                    left: 1.5.sp,
                                    top: 6.h,
                                    child: SizedBox(
                                      height: 34.h,
                                      width: 95.w,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            _categories[i]["url"],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //   left: 20.sp,
                                  //   top: 6.sp,
                                  //   child: Text(
                                  //     _categories[i]["name"],
                                  //     style: TextStyle(
                                  //         letterSpacing: 4,
                                  //         foreground: Paint()
                                  //           ..style = PaintingStyle.stroke
                                  //           ..strokeWidth = 4
                                  //           ..color = Colors.red,
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: 20.sp),
                                  //   ),
                                  // ),
                                  Positioned(
                                    left: 20.sp,
                                    top: 6.sp,
                                    child: Text(
                                      _categories[i]["name"],
                                      style: GoogleFonts.varela(
                                          // letterSpacing: 3,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                  Positioned(
                                      left: 80.w,
                                      top: 3.sp,
                                      child: IconButton(
                                          onPressed: () {
                                            _showModalSheet(i = i);
                                          },
                                          icon: const Icon(
                                            Icons.info_outline,
                                            color: Colors.black,
                                            size: 30,
                                          )))
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _showModalSheet(int i) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            height: 41.h,
            child: Card(
              elevation: 10.sp,
              shadowColor: Colors.pink,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Text(
                  _categories[i]["desc"],
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        });
  }
}
