import 'dart:convert';
import 'package:careerguidancepaths_app/app/account/Pages/MyWorkSpace.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/Categories.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/DynamicPaths.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
  final currentuser=FirebaseAuth.instance.currentUser!;
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
  int activeIndex=0;
  final _Controller=CarouselController();
  List li = [
    'https://img.freepik.com/premium-vector/doctor-character-background-design_730620-7986.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais',
    "https://img.freepik.com/free-vector/engineering-isolated-set_1284-24473.jpg",
    "https://img.freepik.com/premium-vector/law-order-concept-with-flat-icons-policeman-badge-handcuffs-gun-radio-vector-illustration_108855-5272.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais",
    "https://img.freepik.com/free-vector/teacher-concept-illustration_114360-2166.jpg",
    "https://img.freepik.com/free-vector/professional-programmer-engineer-writing-code_3446-693.jpg",
  ];


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
          }, icon: Icon(Icons.search,size: 4.h,))
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
                carouselController: _Controller,
                itemCount: li.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding:  EdgeInsets.all(3.sp),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding:  EdgeInsets.all(3.sp),
                        child: Image.network(
                          li[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    height: 37.5.h,
                    autoPlay: true,
                    initialPage: 1,
                    // viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    // enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    onPageChanged: (index,reason){
                      setState(() {
                        activeIndex=index;
                      });
                    }
                )),
            SizedBox(height: 2.5.h,
              child: AnimatedSmoothIndicator(
                effect: const JumpingDotEffect(),
                activeIndex: activeIndex, count: li.length,onDotClicked: (val){
                _Controller.animateToPage(val);
              },),),
            SizedBox(height: 1.25.h,),
            Container(height: 2.5.h,width: 100.w,color: Colors.amber,),
            SizedBox(height: 1.25.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("If you don't have an any idea ",style: GoogleFonts.varela(fontSize: 18,fontWeight: FontWeight.bold),),
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const categories()));
                  } ,
                  child: Padding(
                    padding:  EdgeInsets.all(3.sp),
                    child: const Text('See All'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(3.sp),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.red,
                            child: Padding(
                              padding:  EdgeInsets.all(3.sp),
                              child: AspectRatio(
                                aspectRatio: 1,
                                 child: ClipRRect(borderRadius: BorderRadius.circular(360),
                                   child: Image.network(
                                     'https://img.freepik.com/premium-vector/doctor-character-background-design_730620-7986.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais',
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.5.w,),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.red,
                            child: Padding(
                              padding:  EdgeInsets.all(3.sp),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(borderRadius: BorderRadius.circular(360),
                                  child: Image.network(
                                    "https://img.freepik.com/free-vector/engineering-isolated-set_1284-24473.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.5.w,),
                          CircleAvatar(backgroundColor: Colors.red,
                            radius: 40,
                            child: Padding(
                              padding:  EdgeInsets.all(3.sp),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(borderRadius: BorderRadius.circular(360),
                                  child: Image.network(
                                    "https://img.freepik.com/premium-vector/law-order-concept-with-flat-icons-policeman-badge-handcuffs-gun-radio-vector-illustration_108855-5272.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 7.5.w,),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red,
                          child: Padding(
                            padding:  EdgeInsets.all(3.sp),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(borderRadius: BorderRadius.circular(360),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/engineering-isolated-set_1284-24473.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.5.w,),
                        CircleAvatar(backgroundColor: Colors.red,
                          radius: 50,
                          child: Padding(
                            padding:  EdgeInsets.all(3.sp),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(borderRadius: BorderRadius.circular(360),
                                child: Image.network(
                                  "https://img.freepik.com/premium-vector/law-order-concept-with-flat-icons-policeman-badge-handcuffs-gun-radio-vector-illustration_108855-5272.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 22.5.h,width: 27.5.w,child: Card(
                  color: Colors.teal,
                  child: Center(
                    child: Text('Click Here',style: GoogleFonts.varela(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                  ),
                ),)
              ],
            ),
            SizedBox(height: 1.25.h,),
            Container(height: 2.5.h,width:100.w,color: Colors.amber,),
            SizedBox(height: 1.25.h,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(3.sp),
                  child: Container(height: 20.h,width: 40.w,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),),
                ),
                Column(
                  children: [
                    Text('Career Catalyst',style: GoogleFonts.varela(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    Text('Begin your Career with greatest\n support from this Platform',textAlign:TextAlign.justify,style: GoogleFonts.varela(),)
                  ],
                )
              ],
            ),
            SizedBox(height: 1.25.h,),
            Container(height: 2.5.h,width: 100.w,color: Colors.amber,),
            SizedBox(height: 1.25.h,),
            Padding(
              padding:  EdgeInsets.all(3.sp),
              child: CarouselSlider(items: [
                Padding(
                  padding:  EdgeInsets.all(3.sp),
                  child: Container(color: Colors.green,),
                ),
                Padding(
                  padding:  EdgeInsets.all(3.sp),
                  child: Container(color: Colors.red,),
                ),
                Padding(
                  padding:  EdgeInsets.all(3.sp),
                  child: Container(color: Colors.black12,),
                ),
                Padding(
                  padding:  EdgeInsets.all(3.sp),
                  child: Container(color: Colors.purpleAccent,),
                ),
                Padding(
                  padding:  EdgeInsets.all(3.sp),
                  child: Container(color: Colors.pink,),
                )
              ], options: CarouselOptions(height: 31.25.h,autoPlay: true)),
            ),
            ElevatedButton(onPressed: (){}, child: const Text('View All')),
            SizedBox(height: 1.25.h,),
            Container(height: 2.5.h,width: 100.w,color: Colors.amber,),
            SizedBox(height: 1.25.h,),
            Padding(
              padding:  EdgeInsets.all(4.sp),
              child: ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(60),bottomRight: Radius.circular(60)),
                child: Container(
                  height: 36.25.h,width: 90.w,color: Colors.greenAccent,
                  child: Column(
                    children: [
                      Text('Career Success Stories',style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 24),),
                      SizedBox(height: 2.5.h,),
                      Container(height: 22.5.h,width: 80.w,decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(30)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(height: 17.5.h,width: 35.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black,),),
                          Container(height: 17.5.h,width: 37.5.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white),)
                        ],
                      ),),
                      ElevatedButton(onPressed: (){}, child: Text('Check Out Some Stories',style: GoogleFonts.varela(),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.25.h,),
            Container(height: 2.5.h,width: 100.w,color: Colors.amber,),
            SizedBox(height: 1.25.h,),
            Padding(
              padding:  EdgeInsets.all(3.sp),
              child: Container(height: 75.h,width: 95.w,decoration: const BoxDecoration(color: Colors.orangeAccent,borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomLeft: Radius.circular(80))),
              child: Column(
                children: [
                  Text('Trending Paths',style: GoogleFonts.varela(fontSize: 22.sp,fontWeight: FontWeight.bold),),
                  SizedBox(height: 2.5.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 20.h,width: 35.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),),color: Colors.brown),
                      ),
                      Container(
                        height: 20.h,width: 35.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),),color: Colors.brown),
                      )
                    ],
                  ),
                  SizedBox(height: 2.5.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 20.h,width: 35.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),),color: Colors.brown),
                      ),
                      Container(
                        height: 20.h,width: 35.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),),color: Colors.brown),
                      )
                    ],
                  ),
                  SizedBox(height: 2.5.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20.h,width: 35.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),),color: Colors.brown),
                      ),

                    ],
                  )
                ],
              )
                ,),
            ),
            Padding(
              padding:  EdgeInsets.all(10.sp),
              child: InkWell(
                onTap: ()async{
                  final data = await FirebaseFirestore.instance
                      .collection('Users')
                      .doc(currentuser.uid)
                      .collection('WorkSpace')
                      .doc(currentuser.email)
                      .get();
                  if (data.exists) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const myWorkSpace()));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('WorkSpace is Empty'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const dynamicPaths())).then(
                                            (value) {
                                          Navigator.pop(context);
                                        });
                                  },
                                  child: const Text('Add')),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'))
                            ],
                          );
                        });
                  }
                },
                child: SizedBox(height: 8.h,width: 98.w,child: Card(color: Colors.green,elevation: 20,shadowColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text('Go To MyWorkSpace',style: GoogleFonts.varela(fontWeight: FontWeight.bold, fontSize: 20),)),),),
              ),
            )
          ],
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