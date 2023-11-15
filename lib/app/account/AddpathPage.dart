import 'package:careerguidancepaths_app/app/account/Provider/CPIprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class addPathPage extends StatefulWidget {
  const addPathPage({super.key});

  @override
  State<addPathPage> createState() => _addPathPageState();
}

class _addPathPageState extends State<addPathPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<cpiProvider>(
      builder: (BuildContext context, value, Widget? child) => Scaffold(
        appBar: AppBar(backgroundColor: Colors.redAccent,title: Text('Add Post',style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.white),),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.sp,
              ),
              SizedBox(
                height: (9.6).h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp),
                          side: const BorderSide(width: 3, color: Colors.red)),
                      child: Padding(
                        padding: EdgeInsets.all(13.sp),
                        child: Text(
                          value.txt1.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 10.w,
                      center: Text(
                        value.txt2.toString(),
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w800),
                      ),
                      percent: value.i.toDouble(),
                      animationDuration: 1000,
                      animation: true,
                      lineWidth: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Center(
                child: SizedBox(
                  height: (68.9).h,
                  child: value.classes[value.z],
                ),
              ),
              Container(
                child: value.rows[value.x],
              )
            ],
          ),
        ),
      ),
    );
  }
}
