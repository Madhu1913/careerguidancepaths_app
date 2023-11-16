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
                left: 13.w,
                top: 19.h,
                child: Text(
                  _nameImg[widget.i]['name'],
                  style: GoogleFonts.varela(
                      fontWeight: FontWeight.bold, fontSize: 24),
                )),
           // Positioned(left: 11.w,top:21.h,child: Container(color: Colors.yellow,height: 0.4.h,width: 80.w,)),
            Positioned(
              top: 25.h,
              left: 16.w,
              child: SizedBox(
                height: 40.h,
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
                              color: Colors.red,
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
                              ? Icon(Icons.arrow_downward_outlined)
                              : Container(),
                        ],
                      );
                    }),
              ),
            ),
            Positioned(
              top: 25.h,
              left: 6.w,
              child: SlideTransition(
                position: _offsetAnimation!,
                child: SizedBox(
                  height: 43.h,
                  width: 90.w,
                  child: Card(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.red,width: 4)),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(8.sp),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('DESCRIPTION',style: GoogleFonts.varela(fontSize: 24,fontWeight: FontWeight.bold),),
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
              top: 68.h,
              left: 30.w,
              child:
                  Card(color: Color(0xff63b4d1),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            _controller!.reverse();
                          },
                          icon: Icon(Icons.keyboard_double_arrow_left_outlined,size: 24.sp,color: Colors.white,)),
                    ),
                  )),
            Positioned(
                top: 68.h,
                left: 60.w,
                child:
                Card(color: Color(0xff63b4d1),
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
    // Circle

    Paint paint_fill_0 = Paint()
      ..color = Color(0xff3c493f)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9395750, size.height * 0.8466625);
    path_0.cubicTo(
        size.width * 1.0556000,
        size.height * 0.8594250,
        size.width * 0.9876000,
        size.height * 0.8534750,
        size.width * 0.9416250,
        size.height * 0.9579125);
    path_0.cubicTo(
        size.width * 0.9161000,
        size.height * 1.0159250,
        size.width * 0.9892000,
        size.height * 1.0059875,
        size.width * 0.7861500,
        size.height * 0.9836375);
    path_0.cubicTo(
        size.width * 0.6701250,
        size.height * 0.9708750,
        size.width * 0.7274250,
        size.height * 0.9475500,
        size.width * 0.7721000,
        size.height * 0.8460250);
    path_0.cubicTo(
        size.width * 0.7976250,
        size.height * 0.7880125,
        size.width * 0.7365250,
        size.height * 0.8243125,
        size.width * 0.9395750,
        size.height * 0.8466625);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Circle Copy

    Paint paint_fill_1 = Paint()
      ..color =Color(0xff3c493f)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0738500, size.height * 0.9694375);
    path_1.cubicTo(
        size.width * -0.0428250,
        size.height * 0.9582750,
        size.width * 0.0254750,
        size.height * 0.9632875,
        size.width * 0.0656750,
        size.height * 0.8582500);
    path_1.cubicTo(
        size.width * 0.0880000,
        size.height * 0.7999125,
        size.width * 0.0154750,
        size.height * 0.8108500,
        size.width * 0.2196750,
        size.height * 0.8304000);
    path_1.cubicTo(
        size.width * 0.3363750,
        size.height * 0.8415625,
        size.width * 0.2803750,
        size.height * 0.8656625,
        size.width * 0.2413000,
        size.height * 0.9677625);
    path_1.cubicTo(
        size.width * 0.2189750,
        size.height * 1.0261125,
        size.width * 0.2780500,
        size.height * 0.9889750,
        size.width * 0.0738500,
        size.height * 0.9694375);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Circle Copy Copy

    Paint paint_fill_2 = Paint()
      ..color = Color(0xff3c493f)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9289500, size.height * 0.0320250);
    path_2.cubicTo(
        size.width * 1.0449750,
        size.height * 0.0447875,
        size.width * 0.9769750,
        size.height * 0.0388375,
        size.width * 0.9310000,
        size.height * 0.1432750);
    path_2.cubicTo(
        size.width * 0.9054750,
        size.height * 0.2012875,
        size.width * 0.9785750,
        size.height * 0.1913500,
        size.width * 0.7755250,
        size.height * 0.1690000);
    path_2.cubicTo(
        size.width * 0.6595000,
        size.height * 0.1562375,
        size.width * 0.7168000,
        size.height * 0.1329125,
        size.width * 0.7614750,
        size.height * 0.0313875);
    path_2.cubicTo(
        size.width * 0.7870000,
        size.height * -0.0266250,
        size.width * 0.7259000,
        size.height * 0.0096750,
        size.width * 0.9289500,
        size.height * 0.0320250);
    path_2.close();

    canvas.drawPath(path_2, paint_fill_2);

    // Circle Copy Copy Copy

    Paint paint_fill_3 = Paint()
      ..color = Color(0xff3c493f)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.9289500, size.height * 0.0320250);
    path_3.cubicTo(
        size.width * 1.0449750,
        size.height * 0.0447875,
        size.width * 0.9769750,
        size.height * 0.0388375,
        size.width * 0.9310000,
        size.height * 0.1432750);
    path_3.cubicTo(
        size.width * 0.9054750,
        size.height * 0.2012875,
        size.width * 0.9785750,
        size.height * 0.1913500,
        size.width * 0.7755250,
        size.height * 0.1690000);
    path_3.cubicTo(
        size.width * 0.6595000,
        size.height * 0.1562375,
        size.width * 0.7168000,
        size.height * 0.1329125,
        size.width * 0.7614750,
        size.height * 0.0313875);
    path_3.cubicTo(
        size.width * 0.7870000,
        size.height * -0.0266250,
        size.width * 0.7259000,
        size.height * 0.0096750,
        size.width * 0.9289500,
        size.height * 0.0320250);
    path_3.close();

    canvas.drawPath(path_3, paint_fill_3);

    // Circle Copy Copy Copy Copy

    Paint paint_fill_4 = Paint()
      ..color = Color(0xff3c493f)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.0685750, size.height * 0.1544500);
    path_4.cubicTo(
        size.width * -0.0492250,
        size.height * 0.1467750,
        size.width * 0.0195500,
        size.height * 0.1497500,
        size.width * 0.0472000,
        size.height * 0.0437125);
    path_4.cubicTo(
        size.width * 0.0625750,
        size.height * -0.0152000,
        size.width * -0.0085250,
        size.height * -0.0021250,
        size.width * 0.1976250,
        size.height * 0.0113250);
    path_4.cubicTo(
        size.width * 0.3154250,
        size.height * 0.0190125,
        size.width * 0.2624000,
        size.height * 0.0447375,
        size.width * 0.2355250,
        size.height * 0.1478125);
    path_4.cubicTo(
        size.width * 0.2201750,
        size.height * 0.2067125,
        size.width * 0.2747500,
        size.height * 0.1679000,
        size.width * 0.0685750,
        size.height * 0.1544500);
    path_4.close();

    canvas.drawPath(path_4, paint_fill_4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
