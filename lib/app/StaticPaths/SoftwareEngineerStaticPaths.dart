import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class softwareEngineerStaticPaths extends StatefulWidget {
  final int i;
  const softwareEngineerStaticPaths({super.key, required this.i});

  @override
  State<softwareEngineerStaticPaths> createState() => _softwareEngineerStaticPathsState();
}

class _softwareEngineerStaticPathsState extends State<softwareEngineerStaticPaths>with SingleTickerProviderStateMixin {
  List _frontEnd=[];
  List _backEnd=[];
  List _devOps=[];
  List _fullStack=[];
  List _android=[];
  List _uiUx=[];
  List _cyberSecurity=[];
  List _gameDeveloper=[];
  List _reactNative=[];
  List _graphicsDesign=[];
  List _aiandDataScientist=[];
  List _softwareArchitect=[];
  List _flutter=[];
  List _blockChain=[];
  List _aspnNetCore=[];
  List _postrageSql=[];
  List _qa=[];
  List _technicalWriter=[];
  List _nameImg=[];
  List _desc=[];





  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _nameImg=data["subSoft"];
      _desc=data["SoftwareEngineerDescription"];
        _frontEnd=data["FrontEnd"];
        _backEnd=data["Backend"];
        _devOps=data["devops"];
        _fullStack=data["FullStack"];
      _android=data["Andriod"];
      _uiUx=data["UI/UX"];
      _cyberSecurity=data["CyberSecurity"];
      _gameDeveloper=data["Game Devloper"];
      _reactNative=data["ReactNative"];
      _graphicsDesign=data["GraphicsDesign"];
      _aiandDataScientist=data["AIandDataScientist"];
      _softwareArchitect=data["SoftwareArchitect"];
      _flutter=data["Flutter"];
      _blockChain=data["BlockChain"];
      _aspnNetCore=data["ASP.NETCore"];
      _postrageSql=data["PostgreSQL"];
      _qa=data["QA"];
      _technicalWriter=data["TechnicalWriter"];

    });
  }
late List data=[_frontEnd,_backEnd,_devOps,_fullStack,_android,_uiUx,_cyberSecurity,_gameDeveloper,_reactNative,_graphicsDesign,_aiandDataScientist,_softwareArchitect,_flutter,_blockChain,_aspnNetCore,_postrageSql,_qa,_technicalWriter];
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

    return SafeArea(
      child: Scaffold(
      body: Stack(
        children: [
          // Container(
          //   height: 32.5.h,
          //   width: 50.w,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //     image: NetworkImage(_nameImg[widget.i]['url']),
          //   )),
          // ),
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
              left: 5.w,
              top: 12.5.h,
              child: Text(
                _nameImg[widget.i]['name'],
                style: GoogleFonts.varela(
                    fontWeight: FontWeight.bold, fontSize: 24),
              )),
          Positioned(
            top: 19.h,
            left: 12.w,
            child: SizedBox(
              height: 56.h,
              width: 65.w,
              // alignment: Alignment(0,1),
              child: ListView.builder(
                // shrinkWrap: true,
                  itemCount: data[widget.i].length,
                  itemBuilder: (context, i) {
                    List myList=data[widget.i];
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
            top: 18.h,
            left: 6.w,
            child: SlideTransition(
                position: _offsetAnimation!,
                child: SizedBox(
                  height: 58.h,
                  width: 90.w,
                  child: Card(
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('DESCRIPTION',style: GoogleFonts.varela(fontSize: 24,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: 1.h,),
                        Text('${_desc[widget.i]["description"]}',style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 14.sp),textAlign: TextAlign.justify,)
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
              Card(color: Colors.red,
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
              Card(color: Colors.red,
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        _controller!.forward();
                      },
                      icon: Icon(Icons.keyboard_double_arrow_right_outlined,size: 24.sp,color: Colors.white,)),
                ),
              )),

          // Text('hii')
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

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 253, 13, 13)
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

    canvas.drawPath(path_0, paint_fill_0);

    // Circle Copy

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);

    // Circle Copy Copy

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 253, 13, 13)
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

    canvas.drawPath(path_1, paint_fill_1);

    // Circle Copy Copy

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
