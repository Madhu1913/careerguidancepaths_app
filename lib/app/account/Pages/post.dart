// import 'package:careerguidancepaths_app/app/account/Provider/careerPointsDataProvider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
//
// import '../Provider/CPIprovider.dart';
//
//
// class test extends StatefulWidget {
//   const test({super.key});
//
//   @override
//   State<test> createState() => _testState();
// }
//
// class _testState extends State<test> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<cpiProvider, cpdProvider>(
//         builder: (BuildContext context, value1, value2, Widget? child) =>
//             Scaffold(
//               appBar: AppBar(),
//               body: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding:  EdgeInsets.symmetric(horizontal: 24.0.sp),
//                           child: Text(
//                             value2.careerName,
//                             style: TextStyle(
//                                 fontSize: 20.sp, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         SizedBox(
//                           height: (4.6).h,
//                           width: 25.w,
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.sp),
//                             ),
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(15.sp),
//                                 child: value1.haveimg != 0
//                                     ? InkWell(
//                                   onTap: (){value2.imgShowfil(context, value1.image);},
//                                   child: Image.file(
//                                     value1.image!,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 )
//                                     : InkWell(
//                                   onTap: (){value2.imgShownet(context, value1.selimg.toString());},
//                                   child: Image.network(
//                                     value1.selimg.toString(),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 )),
//                           ),
//                         )
//                       ],
//                     ),
//                  SizedBox(
//                       height: 5.sp,
//                     ),
//                     CarouselSlider(
//                         items: [
//                           if (value2.li.length >= 3)
//                             ListView.builder(
//                                 itemCount: value2.li1.length,
//                                 itemBuilder: (context, i) {
//                                   return Column(children: [
//                                     Container(
//                                       height: (6.9).h,
//                                       width: 75.w,
//                                       color: Colors.amberAccent,
//                                       child: Center(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: (6.9).h),
//                                             child: Text(
//                                               value2.li1[i],
//                                               style:  TextStyle(
//                                                   fontSize: 15.sp,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           )),
//                                     ),
//                                      Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "|",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15.sp),
//                                         ),
//                                         Icon(
//                                           Icons.arrow_downward_outlined,
//                                           size: 25.sp,
//                                         ),
//                                       ],
//                                     )
//                                   ]);
//                                 }),
//                           if (value2.li.length >= 6)
//                             ListView.builder(
//                                 itemCount: value2.li2.length,
//                                 itemBuilder: (context, i) {
//                                   return Column(children: [
//                                     Container(
//                                       height: (6.9).h,
//                                       width: 75.w,
//                                       color: Colors.amberAccent,
//                                       child: Center(
//                                           child: Padding(
//                                             padding:  EdgeInsets.symmetric(
//                                                 horizontal: (6.9).h),
//                                             child: Text(
//                                               value2.li2[i],
//                                               style:  TextStyle(
//                                                   fontSize: 15.sp,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           )),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "|",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15.sp),
//                                         ),
//                                         Icon(
//                                           Icons.arrow_downward_outlined,
//                                           size: 25.sp,
//                                         ),
//                                       ],
//                                     )
//                                   ]);
//                                 }),
//                           if (value2.li.length >= 9)
//                             ListView.builder(
//                                 itemCount: value2.li3.length,
//                                 itemBuilder: (context, i) {
//                                   return Column(children: [
//                                     Container(
//                                       height: (6.9).h,
//                                       width: 75.w,
//                                       color: Colors.amberAccent,
//                                       child: Center(
//                                           child: Padding(
//                                             padding:  EdgeInsets.symmetric(
//                                                 horizontal: (6.9).h),
//                                             child: Text(
//                                               value2.li3[i],
//                                               style:  TextStyle(
//                                                   fontSize: 15.sp,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           )),
//                                     ),
//                                      Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "|",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 15.sp),
//                                         ),
//                                         Icon(
//                                           Icons.arrow_downward_outlined,
//                                           size: 25.sp,
//                                         ),
//                                       ],
//                                     )
//                                   ]);
//                                 })
//                         ],
//                         options: CarouselOptions(
//                           height: 75.w,
//                           viewportFraction: 1,
//                           enableInfiniteScroll: false,
//                         )),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13.sp),
//                           child: Text(
//                             'Description',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20.sp),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(3.0.sp),
//                       child: Divider(
//                         height: 2,
//                         thickness: 2,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                       child: SingleChildScrollView(
//                           child: Text(
//                             value2.desc,
//                             style:
//                             TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
//                           )),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13.sp),
//                           child: Text(
//                             'Sources',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 19.sp),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(3.0.sp),
//                       child: Divider(
//                         height: 2,
//                         thickness: 2,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                       width: 98.w,
//                       child: SingleChildScrollView(
//                         child: Text(value2.sour.toString()),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }
// }