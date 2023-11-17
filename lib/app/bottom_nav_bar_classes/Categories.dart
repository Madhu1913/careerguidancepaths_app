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
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _categories = data["categories"];
      _docsub = data["subDoc"];
      _engSub = data["subEng"];
      _polSub = data["subPol"];
      _tecSub = data["subTec"];
      _sofEngSub = data["subSoft"];
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
      const lawyer(),
      const judge(),
      const pilot(),
      const locoPilot(),
      const bankEmployee(),
      const airHosters(),
      const ias(),
      const ips(),
      const chef(),
      const sportsCoach(),
      const astrounaut(),
      const archeologist(),
      const fashionDesigner(),
      const eventManager(),
      const librarian()
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
      appBar: AppBar(elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: GoogleFonts.varela(
              fontSize: 26.sp, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
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
                                    height: 34.h,
                                    width: 96.w,
                                    child: Card(elevation: 10,shadowColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp),side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 2)),
                                      color: Theme.of(context).colorScheme.secondaryContainer,
                                    ),
                                  ),
                                  Positioned(
                                      top:9.h,left:6.w,
                                      child: ClipRRect(borderRadius: BorderRadius.circular(20.sp),
                                          child: SizedBox(height: 15.h,width: 30.w,
                                            child: FadeInImage.assetNetwork(placeholder: 'assets/giphy.gif', image: _categories[i]['url'],fit: BoxFit.fill,),))),
                                  Positioned(
                                    left: 38.w,
                                      top: 3.h,
                                      child: SizedBox(height: 29.h,width: 54.w,child: Card(shape:RoundedRectangleBorder(side: BorderSide(color: Theme.of(context).colorScheme.background,width: 2)),
                                        child: Padding(
                                          padding:  EdgeInsets.all(4.sp),
                                          child: Column(
                                            children: [
                                              Text(_categories[i]['name'],style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                                              SizedBox(height: 0.2.h,),
                                              Padding(
                                                padding:  EdgeInsets.all(3.sp),
                                                child: Text(_categories[i]['desc'],style: GoogleFonts.varela(fontSize: 10.5.sp),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),))


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




}
