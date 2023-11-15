import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class eventManager extends StatefulWidget {
  const eventManager({super.key});

  @override
  State<eventManager> createState() => _eventManagerState();
}

class _eventManagerState extends State<eventManager>  with SingleTickerProviderStateMixin{
  List _eventManager=[];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _eventManager=data["EVENT MANAGER"];
    });
  }
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(15, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 020, child: SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container(
            //   child: CustomPaint(
            //     size: Size(
            //         100.w,
            //         (100.w * 2.0)
            //             .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //     painter: RPSCustomPainter(),
            //   ),
            // ),
            Positioned(
                left: 16.w,
                top: 14.h,
                child: Text(
                  'Event Manager',
                  style: GoogleFonts.varela(
                      fontWeight: FontWeight.bold, fontSize: 24),
                )),
            Positioned(left: 11.w,top:19.h,child: Container(color: Colors.yellow,height: 0.4.h,width: 80.w,)),
            Positioned(
              top: 21.h,
              left: 13.w,
              child: SizedBox(
                height: 60.h,
                width: 65.w,
                // alignment: Alignment(0,1),
                child: ListView.builder(
                  // shrinkWrap: true,
                    itemCount: _eventManager.length,
                    itemBuilder: (context, i) {
                      // List myList = data[widget.i];
                      return Column(
                        children: [
                          SizedBox(
                            height: 7.5.h,
                            // width: 100
                            child: Card(
                              color: Colors.red,
                              child: Center(
                                  child: Text(
                                    '${_eventManager[i]['point']}',
                                    style: GoogleFonts.varela(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          i != _eventManager.length - 1
                              ? Icon(Icons.arrow_downward_outlined)
                              : Container(),
                        ],
                      );
                    }),
              ),
            ),
            // Positioned(
            //   top: 23.h,
            //   left: 6.w,
            //   child: SlideTransition(
            //       position: _offsetAnimation!,
            //       child: SizedBox(
            //         height: 45.h,
            //         width: 90.w,
            //         child: Card(
            //           child: Column(
            //             children: [
            //               Row(mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Text('DESCRIPTION',style: GoogleFonts.varela(fontSize: 24,fontWeight: FontWeight.bold),),
            //                 ],
            //               ),
            //               SizedBox(height: 1.h,),
            //               Text('${_desc[widget.i]["description"]}',style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 14.sp),textAlign: TextAlign.justify,)
            //             ],
            //           ),
            //         ),
            //       )
            //   ),
            // ),
            // Positioned(
            //     top: 68.h,
            //     left: 30.w,
            //     child:
            //     Card(color: Colors.red,
            //       child: Center(
            //         child: IconButton(
            //             onPressed: () {
            //               _controller!.reverse();
            //             },
            //             icon: Icon(Icons.keyboard_double_arrow_left_outlined,size: 24.sp,color: Colors.white,)),
            //       ),
            //     )),
            // Positioned(
            //     top: 68.h,
            //     left: 60.w,
            //     child:
            //     Card(color: Colors.red,
            //       child: Center(
            //         child: IconButton(
            //             onPressed: () {
            //               _controller!.forward();
            //             },
            //             icon: Icon(Icons.keyboard_double_arrow_right_outlined,size: 24.sp,color: Colors.white,)),
            //       ),
            //     )),

          ],
        ),
      ),
    ));
  }
}
