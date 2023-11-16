import 'package:careerguidancepaths_app/app/account/Provider/careerPointsDataProvider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Provider/CPIprovider.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<cpiProvider, cpdProvider>(
        builder: (BuildContext context, value1, value2, Widget? child) =>
          SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 24.0.sp),
                          child: Text(
                            value2.careerName,
                            style: GoogleFonts.varela(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                          width: 14.w,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.sp),
                                child: value1.haveimg != 0
                                    ? InkWell(
                                  onTap: (){value2.imgShowfil(context, value1.image);},
                                  child: Image.file(
                                    value1.image!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                                    : InkWell(
                                  onTap: (){value2.imgShownet(context, value1.selimg.toString());},
                                  child: Image.network(
                                    value1.selimg.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    SizedBox(
                      height: 40.h,
                       child: ListView.builder(
                            itemCount: value2.li.length,
                            itemBuilder: (context, i) {
                              return Column(children: [
                                Container(
                                  height: (6.9).h,
                                  width: 75.w,
                                  color: Colors.amberAccent,
                                  child: Center(
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                            horizontal: (6.9).h),
                                        child: Text(
                                          value2.li[i],
                                          style:  GoogleFonts.varela(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                i!=value2.li.length?Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   "|",
                                    //   style: GoogleFonts.varela(
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 15.sp),
                                    // ),
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: 25.sp,
                                    ),
                                  ],
                                ):Container()
                              ]);
                            })
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.sp),
                          child: Text(
                            'Description',
                            style: GoogleFonts.varela(
                                fontWeight: FontWeight.bold, fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0.sp),
                      child: const Divider(
                        height: 2,
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(3.sp),
                      child: Text(
                        value2.desc,
                        style:
                        GoogleFonts.varela(fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.sp),
                          child: Text(
                            'Sources',
                            style: GoogleFonts.varela(
                                fontWeight: FontWeight.bold, fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0.sp),
                      child: const Divider(
                        height: 2,
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                      width: 98.w,
                      child: SingleChildScrollView(
                        child: Text(value2.sour.join(" , ").toString()),
                      ),
                    )
                  ],
                ),
              ),
            );
  }
}
