import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';



class AverageSalary extends StatelessWidget {
  const AverageSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: Text('Average Salaries',style: GoogleFonts.varela(),),
          backgroundColor: Theme.of(context).colorScheme.primary,
        )),
        // backgroundColor: Colors.grey,
        body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/free-vector/illustration-data-analysis-graph_53876-5894.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 1.h,),
                            Text(
                              'Teacher',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                                ),
                                Text(
                                  ' ₹3.42 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                                ),
                                Text(
                                  '\$61,420 ',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                                ),
                                Text(
                                  " €50,172",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                                ),
                                Text(
                                  " ¥194,519",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/premium-vector/coding-web-design-vector-line-icon_116137-2957.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Engineer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                                ),
                                Text(
                                  ' ₹8.0 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                                ),
                                Text(
                                  ' \$91,700 ',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " €77,000",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " ¥24,800",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/free-psd/world-cup-text-frame-top-view_187299-11374.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Police',
                              style: TextStyle(

                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  ' ₹4.17 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  ' \$54,100 ',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " €27,781",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " ¥1,89,554",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/premium-vector/restaurant-cafe-logo-spoon-fork-vector_864013-157.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Chef',
                              style: TextStyle(

                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  ' ₹5.14 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  ' \$52,503',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " €46,269",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " ¥29,725",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/free-photo/3d-render-realistic-medical-stethoscope-color-background_460848-10589.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Doctor',
                              style: TextStyle(

                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  ' ₹7.50 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  ' \$209.044 ',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " €151.608",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  " ¥688,987",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/free-vector/spaceman-sitting-chair-astronaut-captain-fiction_74855-102.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Astronaut',
                              style: TextStyle(

                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '₹ 9.7 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '\$ 137,751',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "€ 49,287",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "¥ 202,524",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/premium-vector/mining-tools-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1898.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',

                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Archeologist',
                              style: TextStyle(

                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize:13.sp,color: Colors.white ),
                                ),
                                Text(
                                  '₹ 8.4 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '\$ 61,910',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "€ 39,272",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "¥ 246,417",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/free-vector/hand-drawn-fashion-designer-workplace-illustration_23-2148823798.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=aishttps://img.freepik.com/free-vector/hand-drawn-fashion-designer-workplace-illustration_23-2148823798.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Fashion Designer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '₹ 9.30 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '\$ 70,000',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize:13.sp,color: Colors.white),
                                ),
                                Text(
                                  "€ 69,164",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize:13.sp,color: Colors.white),
                                ),
                                Text(
                                  "¥ 211,700",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/premium-vector/committee-council-line-vector-icon_116137-7339.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Event Manager',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '₹ 4.8 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '\$ 60,860',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "€ 52,920",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "¥ 26,000",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 22.h,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 37.5.w,
                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                'https://img.freepik.com/free-vector/library-concept-illustration_114360-2788.jpg?size=626&ext=jpg&ga=GA1.1.818006338.1696755883&semt=ais',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Librarian',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp),
                            ),
                            SizedBox(
                              height: 2.3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'India : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '₹ 4.0 lakhs',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' USA : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  '\$ 60,000',
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' Germany : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "€ 50,897",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  ' China : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.white),
                                ),
                                Text(
                                  "¥ 16,047",
                                  style: TextStyle(fontSize: 13.sp,color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
        );
  }
}
