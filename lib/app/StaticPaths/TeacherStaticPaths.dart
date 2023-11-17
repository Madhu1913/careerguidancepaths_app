import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class teacherStaticPaths extends StatefulWidget {
  final int i;

  const teacherStaticPaths({super.key, required this.i});

  @override
  State<teacherStaticPaths> createState() => _teacherStaticPathsState();
}

class _teacherStaticPathsState extends State<teacherStaticPaths>
    with SingleTickerProviderStateMixin {
  List _lowerStandardTeacher = [];
  List _higherStandardTeacher = [];
  List _intermidiateTeacher = [];
  List _assistantProffesor = [];
  List _proffesor = [];
  List _nameImg = [];
  List _desc=[];


  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _lowerStandardTeacher = data["Lower Standard Teacher"];
      _higherStandardTeacher = data["Higher Standard Teacher"];
      _intermidiateTeacher = data["Intermediate Level Teacher"];
      _assistantProffesor = data["Assistant Professor"];
      _proffesor = data["Professor"];
      _nameImg = data["subTec"];
      _desc=data["TeacherDescription"];
    });
  }

  late List data = [
    _lowerStandardTeacher,
    _higherStandardTeacher,
    _intermidiateTeacher,
    _assistantProffesor,
    _proffesor
  ];
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(15, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: CustomPaint(
                size: Size(
                    100.w,
                    (100.w * 2.0)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
            ),
            Positioned(
                left: 8.w,
                top: 19.h,
                child: Text(
                  _nameImg[widget.i]['name'],
                  style: GoogleFonts.varela(
                      fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),
           // Positioned(left: 11.w,top:21.h,child: Container(color: Colors.yellow,height: 0.4.h,width: 80.w,)),
            Positioned(
              top: 25.h,
              left: 16.w,
              child: SizedBox(
                height: 50.h,
                width: 65.w,
                // alignment: Alignment(0,1),
                child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: data[widget.i].length,
                    itemBuilder: (context, i) {
                      List myList = data[widget.i];
                      return Column(
                        children: [
                          SizedBox(
                            height: 7.5.h,
                            // width: 100
                            child: Card(
                              color: const Color(0xff81B29A),
                              child: Center(
                                  child: Text(
                                '${myList[i]['point']}',
                                style: GoogleFonts.varela(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                          i != myList.length - 1
                              ? const Icon(Icons.arrow_downward_outlined)
                              : Container(),
                        ],
                      );
                    }),
              ),
            ),
            Positioned(
              top: 24.h,
              left: 6.w,
              child: SlideTransition(
                position: _offsetAnimation!,
                child: SizedBox(
                  height: 52.h,
                  width: 90.w,
                  child: Card(shape: const RoundedRectangleBorder(side: BorderSide(color:Color(0xff81B29A),width: 4 )),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(8.sp),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('DESCRIPTION',style: GoogleFonts.varela(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h,),
                        Padding(
                          padding:  EdgeInsets.all(8.sp),
                          child: Text('${_desc[widget.i]["description"]}',style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 13.sp),textAlign: TextAlign.justify,),
                        )
                      ],
                    ),
                  ),
                )
              ),
            ),
            Positioned(
              top: 78.h,
              left: 30.w,
              child:
                  Card(color: const Color(0xffEE6C4D),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            _controller!.reverse();
                          },
                          icon: Icon(Icons.keyboard_double_arrow_left_outlined,size: 24.sp,color: Colors.white,)),
                    ),
                  )),
            Positioned(
                top: 78.h,
                left: 60.w,
                child:
                Card(color: const Color(0xffEE6C4D),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          _controller!.forward();
                        },
                        icon: Icon(Icons.keyboard_double_arrow_right_outlined,size: 24.sp,color: Colors.white,)),
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Circle Copy

    Paint paintFill0 = Paint()
      ..color = const Color(0xff3D405B)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0001570, size.height * 1.0012643);
    path_0.cubicTo(
        size.width * 0.0015886,
        size.height * 0.8797853,
        size.width * 0.0033250,
        size.height * 0.8375875,
        size.width * 0.0020500,
        size.height * 0.6855625);
    path_0.cubicTo(
        size.width * 0.0548000,
        size.height * 0.6390500,
        size.width * -0.0294500,
        size.height * 0.9380625,
        size.width * 0.2650750,
        size.height * 0.9374625);
    path_0.cubicTo(
        size.width * 0.5053500,
        size.height * 0.9465125,
        size.width * 0.7255250,
        size.height * 0.9323000,
        size.width * 1.0016649,
        size.height * 1.0007179);
    path_0.cubicTo(
        size.width * 0.7134374,
        size.height * 1.0036903,
        size.width * 0.2943472,
        size.height * 1.0006581,
        size.width * -0.0001570,
        size.height * 1.0012643);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Circle Copy

    Paint paintStroke0 = Paint()
      ..color = const Color(0xff3D405B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Circle Copy Copy

    Paint paintFill1 = Paint()
      ..color = const Color(0xff3D405B)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9988750, size.height * -0.0012750);
    path_1.cubicTo(
        size.width * 0.9971750,
        size.height * 0.1201875,
        size.width * 0.9954250,
        size.height * 0.1623875,
        size.width * 0.9967500,
        size.height * 0.3144125);
    path_1.cubicTo(
        size.width * 0.9413500,
        size.height * 0.3529125,
        size.width * 1.0281750,
        size.height * 0.0619125,
        size.width * 0.7336500,
        size.height * 0.0625250);
    path_1.cubicTo(
        size.width * 0.4934000,
        size.height * 0.0534875,
        size.width * 0.2732000,
        size.height * 0.0677125,
        size.width * -0.0029500,
        size.height * -0.0007000);
    path_1.cubicTo(
        size.width * 0.2852750,
        size.height * -0.0036875,
        size.width * 0.7043750,
        size.height * -0.0006625,
        size.width * 0.9988750,
        size.height * -0.0012750);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Circle Copy Copy

    Paint paintStroke1 = Paint()
      ..color = const Color(0xff3D405B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paintStroke1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
