import 'dart:convert';
import 'package:careerguidancepaths_app/app/account/Pages/MyWorkSpace.dart';
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
  final currentuser = FirebaseAuth.instance.currentUser!;
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

  int activeIndex = 0;
  final _Controller = CarouselController();
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
  late List classess=[
    doctorSubCategories(docSub: _docsub),
    engineerSubCategories(engSub: _engSub),
    policeSubCategories(polSub: _polSub),
    teacherSubCategory(tecSub: _tecSub),
    softwareEngineerSubCategories(sofEngSub: _sofEngSub),
    pilot(),
    astrounaut(),
    lawyer(),
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        toolbarHeight: 8.h,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
        title: Text(
          'Career Catalyst',
          style: GoogleFonts.varela(fontSize: 22.sp, color: Theme.of(context).colorScheme.background),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.background,
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
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: CustomSearchDelegate(classes));
              },
              icon: Icon(
                Icons.search,
                size: 4.h,
                color: Theme.of(context).colorScheme.background,
              ))
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.75.h,
            ),
            CarouselSlider.builder(
                carouselController: _Controller,
                itemCount: li.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.all(3.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(40.sp)),
                      child: Padding(
                        padding: EdgeInsets.all(3.sp),
                        child: GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>classess[index]));
                        },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(38.sp),
                            child: Image.network(
                              li[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    height: 32.5.h,
                    autoPlay: true,
                    initialPage: 1,
                    // viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    // enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    })),
            SizedBox(
              height: 2.h,
              child: AnimatedSmoothIndicator(
                effect: ExpandingDotsEffect(
                  // dotColor: Colors.blac,
                  dotHeight: 10,
                  dotWidth:10,
                  activeDotColor: Theme.of(context).colorScheme.primary
                ),
                activeIndex: activeIndex,
                count: li.length,
                onDotClicked: (val) {
                  _Controller.animateToPage(val);
                },
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            // Container(
            //   height: 0.5.h,
            //   width: 100.w,
            // color:Theme.of(context).colorScheme.background),
            SizedBox(
              height: 2.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  If you don't have an any idea",
                  style: GoogleFonts.varela(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Row(
              children: [
                Container(
                    height: 22.5.h,
                    width: 100.w,
                    child: Lottie.asset('assets/doubtAnimation.json')),
              ],
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>dynamicPaths()));
            }, child:  Text('Click Here',style:GoogleFonts.varela(color: Theme.of(context).colorScheme.background) ,)),
            SizedBox(
              height: 2.5.h,
            ),
            // Container(
            //     height: 0.5.h,
            //     width: 100.w,
            //     color:Theme.of(context).colorScheme.background),
            SizedBox(
              height: 1.25.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: Container(
                    height: 20.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(24.sp)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.sp),
                        child: Image.asset('assets/careercatalystimage.jpg')),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Career Catalyst',
                      style: GoogleFonts.varela(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Begin your Career with greatest\n support from this Platform',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.varela(),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 1.25.h,
            ),
            // Container(
            //     height: 0.5.h,
            //     width: 100.w,
            //     color:Theme.of(context).colorScheme.background),
            SizedBox(
              height: 1.25.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Average Salaries',
                  style:
                      GoogleFonts.varela(fontSize: 18.sp, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(3.sp),
              child: CarouselSlider(items: [
                Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 26.h,
                          width: 33.w,
                          decoration: const BoxDecoration(
                              color: Colors.cyan,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/free-vector/banknote-concept-illustration_114360-5640.jpg',
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          children: [
                            Card(
                                color: Theme.of(context).colorScheme.tertiary,
                                child: Padding(
                                  padding:  EdgeInsets.all(3.sp),
                                  child: Text(
                                    'Doctor',
                                    style: GoogleFonts.varela(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.sp),
                                  ),
                                )),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'INDIA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ₹7.50 Lakhs',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'USA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : \$209.044',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Germany',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : €209.044',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'China',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ¥688,987',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 26.h,
                          width: 33.5.w,
                          decoration: const BoxDecoration(
                              color: Colors.cyan,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/free-vector/refund-concept-illustration_114360-6803.jpg',
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          children: [
                            Card(
                                color: Theme.of(context).colorScheme.tertiary,
                                child: Padding(
                                  padding:  EdgeInsets.all(3.sp),
                                  child: Text(
                                    'Engineering',
                                    style: GoogleFonts.varela(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.sp),
                                  ),
                                )),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'INDIA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ₹8 Lakhs',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'USA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : \$91,700',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Germany',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : €77,000',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'China',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ¥24,800',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 26.h,
                          width: 35.w,
                          decoration: const BoxDecoration(
                              color: Colors.cyan,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/free-vector/money-income-concept-illustration_114360-7159.jpg?w=740&t=st=1700037666~exp=1700038266~hmac=065ea1e8ef34f63e1d9f5721eff2688ebe7db0034e69c0e191e84a84dd8b8036',
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          children: [
                            Card(
                                color: Theme.of(context).colorScheme.tertiary,
                                child: Padding(
                                  padding:  EdgeInsets.all(3.sp),
                                  child: Text(
                                    'Police',
                                    style: GoogleFonts.varela(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.sp),
                                  ),
                                )),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'INDIA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ₹4 Lakhs',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'USA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : \$54,100',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Germany',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : €60,376',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'China',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ¥189,554',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 26.h,
                          width: 34.w,
                          decoration: const BoxDecoration(
                              color: Colors.cyan,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/free-vector/global-economy-money-business_24877-50954.jpg',
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          children: [
                            Card(
                                color: Theme.of(context).colorScheme.tertiary,
                                child: Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: Text(
                                    'Teacher',
                                    style: GoogleFonts.varela(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.sp),
                                  ),
                                )),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'INDIA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ₹3.4 Lakhs',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'USA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : \$61,420',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Germany',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : €50,172',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'China',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ¥194,519',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 26.h,
                          width: 35.w,
                          decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/free-vector/startup-managers-presenting-analyzing-sales-growth-chart-group-workers-with-heap-cash-rocket-bar-diagrams-with-arrow-heap-money_74855-14166.jpg',
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          children: [
                            Card(
                                color: Theme.of(context).colorScheme.tertiary,
                                child: Padding(
                                  padding:  EdgeInsets.all(3.sp),
                                  child: Text(
                                    'Astronaut',
                                    style: GoogleFonts.varela(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.sp),
                                  ),
                                )),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'INDIA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ₹9.7 Lakhs',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'USA',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : \$1,37,751',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Germany',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : €49,287',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'China',
                                  style: GoogleFonts.varela(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' : ¥202,524',
                                  style: GoogleFonts.varela(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ], options: CarouselOptions(height: 31.25.h, autoPlay: false)),
            ),
            ElevatedButton(onPressed: () {}, child: Text('View All',style: GoogleFonts.varela(color: Theme.of(context).colorScheme.background),)),
            SizedBox(
              height: 1.25.h,
            ),
            // Container(
            //     height: 0.5.h,
            //     width: 100.w,
            //     color:Theme.of(context).colorScheme.background),
            SizedBox(
              height: 1.25.h,
            ),
            Padding(
              padding: EdgeInsets.all(4.sp),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              ),
                elevation: 15,
                shadowColor: Theme.of(context).colorScheme.background,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  child: Container(
                    height: 36.25.h,
                    width: 90.w,
                    // color: Theme.of(context).colorScheme.surfaceVariant,
                    child: Column(
                      children: [
                        Text(
                          'Career Success Stories',
                          style: GoogleFonts.varela(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Container(
                          height: 22.5.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3gtIglmRGkI3sgPTkjTZ00j4bDFOCXSwefg&usqp=CAU'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Check Out Some Stories',
                            style: GoogleFonts.varela(
                              color: Theme.of(context).colorScheme.background
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.25.h,
            ),
            // Container(
            //   height: 1.0.h,
            //   width: 100.w,
            //   color: Colors.amber,
            // ),
            SizedBox(
              height: 1.25.h,
            ),
            Padding(
              padding: EdgeInsets.all(3.sp),
              child: Container(
                height: 71.h,
                width: 95.w,
                decoration:  BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100))),
                child: Column(
                  children: [
                    Text(
                      'Trending Paths',
                      style: GoogleFonts.varela(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30.h,
                          width: 40.w,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                              ),
                              // color: Theme.of(context).colorScheme.errorContainer
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>doctorSubCategories(docSub: _docsub)));
                              
                            },
                            child: Stack(
                              children: [
                                Positioned(left:2.w,top:1.h,
                                    child: Container(height: 27.h,width: 36.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),child: ClipRRect(borderRadius:BorderRadius.circular(20.sp),child: Image.network('https://img.freepik.com/premium-vector/modern-outline-illustration-doctor_203633-11756.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',fit:BoxFit.cover)),)),

                                Positioned(
                                    left: 24.w,
                                    top: 23.h,
                                    child: Container(
                                      height: 6.h,
                                      width: 12.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(child: Text('#1',style: GoogleFonts.varela(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.orange.shade800),)),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 40.w,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                              ),
                              // color: Theme.of(context).colorScheme.errorContainer
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>teacherSubCategory(tecSub: _tecSub)));
                              
                            },
                            child: Stack(
                              children: [
                                Positioned(left:2.w,top:1.h,
                                    child: Container(height: 27.h,width: 36.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),child: ClipRRect(borderRadius:BorderRadius.circular(20.sp),child: Image.network('https://img.freepik.com/free-vector/professor-concept-illustration_114360-4304.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',fit:BoxFit.cover)),)),

                                Positioned(
                                    left: 5.w,
                                    top: 23.h,
                                    child: Container(
                                      height: 6.h,
                                      width: 12.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(child: Text('#2',style: GoogleFonts.varela(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.orange.shade800),)),

                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30.h,
                          width: 40.w,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                              ),
                              // color: Theme.of(context).colorScheme.errorContainer
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>softwareEngineerSubCategories(sofEngSub: _sofEngSub)));
                              
                            },
                            child: Stack(
                              children: [
                                Positioned(left:2.w,top:2.h,
                                    child: Container(height: 27.h,width: 36.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),child: ClipRRect(borderRadius:BorderRadius.circular(20.sp),child: Image.network('https://img.freepik.com/free-vector/software-integration-concept-illustration_114360-7277.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=sph',fit:BoxFit.cover)),)),
                                Positioned(
                                    left: 24.w,
                                    top: 1.h,
                                    child: Container(
                                      height: 6.h,
                                      width: 12.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(child: Text('#3',style: GoogleFonts.varela(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.orange.shade800),)),

                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 40.w,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(24),
                              ),
                              // color: Theme.of(context).colorScheme.errorContainer
                          ),
                          child: GestureDetector(
                            onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>policeSubCategories(polSub: _polSub)));
                            },
                            child: Stack(
                              children: [
                                Positioned(left:2.w,top:2.h,
                                    child: Container(height: 27.h,width: 36.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),child: ClipRRect(borderRadius:BorderRadius.circular(20.sp),child: Image.network('https://img.freepik.com/premium-vector/police-officer-couple-uniform-standing-together-police-characters-public-safety-officers_573689-237.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',fit:BoxFit.cover)),)),

                                Positioned(
                                    left: 5.w,
                                    top: 1.h,
                                    child: Container(
                                      height: 6.h,
                                      width: 12.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(child: Text('#4',style: GoogleFonts.varela(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.orange.shade800),)),

                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: InkWell(
                onTap: () async {
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
                            builder: (context) => const myWorkSpace()));
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
                                                    const dynamicPaths()))
                                        .then((value) {
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
                child: SizedBox(
                  height: 8.h,
                  width: 98.w,
                  child: Card(
                  color: Theme.of(context).colorScheme.error,
                    elevation: 20,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Go To My WorkSpace',
                      style: GoogleFonts.varela(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                ),
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
          return ListTile(
            onTap: () {
              query = matchQuery[i];
              print(query);
              for (int j = 0; j < SearchItems.length; j++) {
                if (SearchItems[j] == query) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => data[j]));
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
          return ListTile(
            onTap: () {
              query = matchQuery[i];
              print(query);
              for (int j = 0; j < SearchItems.length; j++) {
                if (SearchItems[j] == query) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => data[j]));
                }
              }
            },
            title: Text(result),
          );
        });
  }
}
