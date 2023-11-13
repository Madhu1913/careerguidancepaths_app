import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../subcategories/AirHostress.dart';
import '../subcategories/Archeologist.dart';
import '../subcategories/Astrounaut.dart';
import '../subcategories/BankEmployee.dart';
import '../subcategories/Chef.dart';
import '../subcategories/DoctorSubCategory.dart';
import '../subcategories/EngineerSubCategory.dart';
import '../subcategories/EventManager.dart';
import '../subcategories/FashionDesigner.dart';
import '../subcategories/GovernmentEmploySubCategory.dart';
import '../subcategories/Ias.dart';
import '../subcategories/Ips.dart';
import '../subcategories/Judge.dart';
import '../subcategories/Lawyer.dart';
import '../subcategories/Librarian.dart';
import '../subcategories/LocoPilot.dart';
import '../subcategories/Pilot.dart';
import '../subcategories/PoliceSubCategory.dart';
import '../subcategories/SoftwareEngineerSubCategory.dart';
import '../subcategories/SportsCoach.dart';
import '../subcategories/TeacherSubCategory.dart';
import 'Drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 8.h,
        backgroundColor: Colors.red,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.sp)),
        title: Text(
          'Career Catalyst',
          style: GoogleFonts.varela(fontSize: 24.sp, color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 26.sp,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate(classes));
          }, icon: const Icon(Icons.search))
        ],
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Text(
          'Have to be Designed',
          style: GoogleFonts.varela(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
  final List data;

  CustomSearchDelegate(this.data);

  List SearchItems = [
    'Doctor',
    'Engineer',
    'Police',
    'Teacher',
    'Software Engineer',
    'Government Employ',
    'Lawyer',
    'Judge',
    'Pilot',
    'Loco Pilot',
    'Bank Employ',
    'Air Hostress',
    'Ias',
    'Ips',
    'Chef',
    'Sports Coach',
    'Actrounaut',
    'Archeologist',
    'Fashion Designer',
    'Event Manager',
    'Librarian'
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List matchQuery = [];
    for (var alpha in SearchItems) {
      if (alpha.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(alpha);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, i) {
          var result = matchQuery[i];
          return ListTile(onTap: () {
            query=matchQuery[i];
            print(query);
            for(int j=0;j<SearchItems.length;j++){
              if(SearchItems[j]==query){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>data[j]));
              }
            }
          },
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List matchQuery = [];
    for (var alpha in SearchItems) {
      if (alpha.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(alpha);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, i) {
          var result = matchQuery[i];
          return ListTile(onTap: () {
            query=matchQuery[i];
            print(query);
            for(int j=0;j<SearchItems.length;j++){
              if(SearchItems[j]==query){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>data[j]));
              }
            }
          },
            title: Text(result),
          );
        });
  }
}