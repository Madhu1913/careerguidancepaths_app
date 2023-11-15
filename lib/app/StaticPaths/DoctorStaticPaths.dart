import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class doctorStaticPaths extends StatefulWidget {
  final int i;
  const doctorStaticPaths({super.key, required this.i});

  @override
  State<doctorStaticPaths> createState() => _doctorStaticPathsState();
}

class _doctorStaticPathsState extends State<doctorStaticPaths>
    with SingleTickerProviderStateMixin {
  List _cardeologist = [];
  List _nameImg = [];
  List _dermatoligist = [];
  List _peditrician = [];
  List _opthamologist = [];
  List _orthopedicSurgeon = [];
  List _neurologist = [];
  List _psychiatrist = [];
  List _gyneacologist = [];
  List _urologist = [];
  List _otolaryngologist = [];
  List _pulmonologits = [];
  List _emergencyMedicinePhysician = [];
  List _nurse = [];
  List _veternerian = [];
  List _gastreonologist = [];
  List _rheumatologist = [];
  List _endocronologist = [];
  List _nephrologist = [];
  List _immunologist = [];
  List _infectiousDiseaseSpecialist = [];
  List _familyMedicinePhysician = [];
  List _sportsMedicinePhysician = [];
  List _radiologist = [];
  List _anesthesiologist = [];
  List _pathologist = [];
  List _internalMedicinePhysician = [];
  List _desc = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _desc = data["DoctorDescription"];
      _cardeologist = data["Cardeologist"];
      _nameImg = data["subDoc"];
      _dermatoligist = data["Dermatologist"];
      _peditrician = data["Pediatrician"];
      _opthamologist = data["Ophthalmologist"];
      _orthopedicSurgeon = data["Orthopedic surgeon"];
      _neurologist = data["Neurologist"];
      _psychiatrist = data["Psychiatrist"];
      _gyneacologist = data["obstetrician/gynecologist(ob/gyn)"];
      _urologist = data["Urologist"];
      _otolaryngologist = data["otolaryngologist"];
      _pulmonologits = data["Pulmonologist"];
      _emergencyMedicinePhysician = data["emergency medicine physician"];
      _nurse = data["nurse"];
      _veternerian = data["Veternairian"];
      _gastreonologist = data["Gastroenterologist"];
      _rheumatologist = data["Rheumatologist"];
      _endocronologist = data["endocrinologist"];
      _nephrologist = data["Nephrologist"];
      _immunologist = data["Allergist/immunologist"];
      _infectiousDiseaseSpecialist = data["Infectious disease specialist"];
      _familyMedicinePhysician = data["Family medicine physician"];
      _sportsMedicinePhysician = data["Sports medicine physician"];
      _radiologist = data["Radiologist"];
      _anesthesiologist = data["Anesthesiologist"];
      _pathologist = data["Pathologist"];
      _internalMedicinePhysician = data["Internal medicine physician"];
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

  late List data = [
    _cardeologist,
    _dermatoligist,
    _peditrician,
    _opthamologist,
    _orthopedicSurgeon,
    _neurologist,
    _psychiatrist,
    _gyneacologist,
    _urologist,
    _otolaryngologist,
    _pulmonologits,
    _emergencyMedicinePhysician,
    _nurse,
    _veternerian,
    _gastreonologist,
    _rheumatologist,
    _endocronologist,
    _nephrologist,
    _immunologist,
    _infectiousDiseaseSpecialist,
    _familyMedicinePhysician,
    _sportsMedicinePhysician,
    _radiologist,
    _anesthesiologist,
    _pathologist,
    _internalMedicinePhysician
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(backgroundColor: Colors.red,elevation: 0,),
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
                              ? const Icon(Icons.arrow_downward_outlined)
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'DESCRIPTION',
                                style: GoogleFonts.varela(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            '${_desc[widget.i]["description"]}',
                            style: GoogleFonts.varela(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            Positioned(
                top: 78.h,
                left: 30.w,
                child: Card(
                  color: Colors.red,
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          _controller!.reverse();
                        },
                        icon: Icon(
                          Icons.keyboard_double_arrow_left_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        )),
                  ),
                )),
            Positioned(
                top: 78.h,
                left: 60.w,
                child: Card(
                  color: Colors.red,
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          _controller!.forward();
                        },
                        icon: Icon(
                          Icons.keyboard_double_arrow_right_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        )),
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

    Paint paintFill0 = Paint()
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

    canvas.drawPath(path_0, paintFill0);

    // Circle Copy

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Circle Copy Copy

    Paint paintFill1 = Paint()
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

    canvas.drawPath(path_1, paintFill1);

    // Circle Copy Copy

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
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
