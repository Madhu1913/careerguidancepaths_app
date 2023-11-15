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
import 'package:lottie/lottie.dart';
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
import 'package:lottie/lottie.dart';

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
    'https://img.freepik.com/free-vector/doctors-concept-illustration_114360-1515.jpg',
    'https://img.freepik.com/free-vector/building-safety-concept-illustration_114360-7300.jpg',
    'https://img.freepik.com/free-vector/police-officers-concept-illustration_114360-13667.jpg',
    'https://img.freepik.com/free-vector/teacher-concept-illustration_114360-1638.jpg',
    'https://img.freepik.com/free-vector/hand-coding-concept-illustration_114360-8113.jpg?size=626&ext=jpg&uid=R125384538&ga=GA1.1.179435846.1697645450',
    'https://img.freepik.com/free-vector/air-support-concept-illustration_114360-518.jpg',
    'https://img.freepik.com/free-vector/astronaut-suit-illustration_114360-8538.jpg',
    'https://img.freepik.com/free-vector/female-lawyer-concept-illustration_114360-16427.jpg'
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
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
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
            SizedBox(height: 3.75.h,),
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
                effect: const ExpandingDotsEffect(),
                activeIndex: activeIndex, count: li.length,onDotClicked: (val){
                _Controller.animateToPage(val);
              },),),
            SizedBox(height: 2.0.h,),
            Container(height: 1.0.h,width: 100.w,color: Colors.amber,),
            SizedBox(height: 2.0.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("  If you don't have an any idea",style: GoogleFonts.varela(fontSize: 19,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 2.5.h,),
            Row(
              children: [
                Container(height:22.5.h,width:100.w,child: Lottie.asset('assets/doubtAnimation.json')),
              ],
            ),
            ElevatedButton(onPressed: (){}, child: const Text('Click Here')),
            SizedBox(height: 2.5.h,),
            Container(height: 1.0.h,width:100.w,color: Colors.amber,),
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
            Container(height: 1.0.h,width: 100.w,color: Colors.amber,),
            SizedBox(height: 1.25.h,),
            const Text('Average Salaries',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Padding(
              padding:  EdgeInsets.all(3.sp),
              child: CarouselSlider(
                  items: [
                    Padding(
                      padding:  EdgeInsets.all(3.sp),
                      child: Container(
                        child: Row(
                          children: [
                            Container(height: 30.h,width: 32.5.w,
                              decoration: const BoxDecoration(color: Colors.cyan,
                                  image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/banknote-concept-illustration_114360-5640.jpg',),fit: BoxFit.fill)),),
                            Column(
                              children: [
                                const Card(color:Colors.purple,
                                    child: Text('Doctor',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),)),
                                SizedBox(height: 2.5.h,),
                                const Row(
                                  children: [
                                    Text('INDIA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ₹7.50 Lakhs',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('USA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : \$209.044',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Germany',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : €209.044',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('China',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ¥688,987',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(3.sp),
                      child: Container(
                        child: Row(
                          children: [
                            Container(height: 30.h,width: 32.5.w,
                              decoration: const BoxDecoration(color: Colors.cyan,
                                  image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/refund-concept-illustration_114360-6803.jpg',),fit: BoxFit.fill)),),
                            Column(
                              children: [
                                const Card(color:Colors.purple,
                                    child: Text('Engineering',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),)),
                                SizedBox(height: 2.5.h,),
                                const Row(
                                  children: [
                                    Text('INDIA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ₹8 Lakhs',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('USA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : \$91,700',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Germany',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : €77,000',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('China',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ¥24,800',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(3.sp),
                      child: Container(
                        child: Row(
                          children: [
                            Container(height: 30.h,width: 32.5.w,
                              decoration: const BoxDecoration(color: Colors.cyan,
                                  image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/money-income-concept-illustration_114360-7159.jpg?w=740&t=st=1700037666~exp=1700038266~hmac=065ea1e8ef34f63e1d9f5721eff2688ebe7db0034e69c0e191e84a84dd8b8036',),fit: BoxFit.fill)),),
                            Column(
                              children: [
                                const Card(color:Colors.purple,
                                    child: Text('Police',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),)),
                                SizedBox(height: 2.5.h,),
                                const Row(
                                  children: [
                                    Text('INDIA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ₹4 Lakhs',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('USA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : \$54,100',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Germany',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : €60,376',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('China',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ¥189,554',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(3.sp),
                      child: Container(
                        child: Row(
                          children: [
                            Container(height: 30.h,width: 32.5.w,
                              decoration: const BoxDecoration(color: Colors.cyan,
                                  image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/global-economy-money-business_24877-50954.jpg',),fit: BoxFit.fill)),),
                            Column(
                              children: [
                                const Card(color:Colors.purple,
                                    child: Text('Teacher',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),)),
                                SizedBox(height: 2.5.h,),
                                const Row(
                                  children: [
                                    Text('INDIA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ₹3.4 Lakhs',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('USA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : \$61,420',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Germany',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : €50,172',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('China',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ¥194,519',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(3.sp),
                      child: Container(
                        child: Row(
                          children: [
                            Container(height: 30.h,width: 32.5.w,
                              decoration: const BoxDecoration(color: Colors.cyan,
                                  image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/startup-managers-presenting-analyzing-sales-growth-chart-group-workers-with-heap-cash-rocket-bar-diagrams-with-arrow-heap-money_74855-14166.jpg',),fit: BoxFit.fill)),),
                            Column(
                              children: [
                                const Card(color:Colors.purple,
                                    child: Text('Astronaut',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),)),
                                SizedBox(height: 2.5.h,),
                                const Row(
                                  children: [
                                    Text('INDIA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ₹9.7 Lakhs',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('USA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : \$1,37,751',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Germany',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : €49,287',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('China',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' : ¥202,524',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ], options: CarouselOptions(
                  height: 31.25.h,autoPlay: false)),
            ),
            ElevatedButton(onPressed: (){}, child: const Text('View All')),
            SizedBox(height: 1.25.h,),
            Container(height: 1.0.h,width: 100.w,color: Colors.amber,),
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
                      Container(height: 22.5.h,width: 80.w,decoration: BoxDecoration(color: Colors.redAccent,image:const DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3gtIglmRGkI3sgPTkjTZ00j4bDFOCXSwefg&usqp=CAU'),fit: BoxFit.fill),borderRadius: BorderRadius.circular(30)),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text('Check Out Some Stories',style: GoogleFonts.varela(),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.25.h,),
            Container(height: 1.0.h,width: 100.w,color: Colors.amber,),
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
                          height: 30.h,width: 40.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),),color: Colors.brown),
                        ),
                        Container(
                          height: 30.h,width: 40.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(24),),color: Colors.brown),
                        )
                      ],
                    ),
                    SizedBox(height: 4.5.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30.h,width: 40.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),),color: Colors.brown),
                          child: Container(decoration: const BoxDecoration(color: Colors.white,shape: BoxShape.circle),height: 30,width: 30,),),
                        Container(
                          height: 30.h,width: 40.w,decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(24),),color: Colors.brown),
                        )
                      ],
                    ),
                    SizedBox(height: 2.5.h,),
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
