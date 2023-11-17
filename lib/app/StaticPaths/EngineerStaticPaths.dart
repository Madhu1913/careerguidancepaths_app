import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class engineerStaticPaths extends StatefulWidget {
  final int i;
  const engineerStaticPaths({super.key, required this.i});

  @override
  State<engineerStaticPaths> createState() => _engineerStaticPathsState();
}

class _engineerStaticPathsState extends State<engineerStaticPaths>
    with SingleTickerProviderStateMixin {
  List _desc = [];
  List _civilEngineer = [];
  List _mechanicalEngineer = [];
  List _electricalEngineer = [];
  List _chemicalEngineer = [];
  List _computerEngineer = [];
  List _aerospaceEngineer = [];
  List _biomedicalEngineer = [];
  List _environmentalEngineer = [];
  List _petroleumEngineer = [];
  List _industrialEngineer = [];
  List _structuralEngineer = [];
  List _materialsEngineer = [];
  List _miningEngineer = [];
  List _geotechnicalEngineer = [];
  List _nuclearEngineer = [];
  List _marineEngineer = [];
  List _roboticsEngineer = [];
  List _systemsEngineer = [];
  List _softwareEngineer = [];
  List _telecommunicationsEngineer = [];
  List _trafficEngineer = [];
  List _waterResourcesEngineer = [];
  List _fireProtectionEngineer = [];
  List _railwayEngineer = [];
  List _renewableEnergyEngineer = [];
  List _automotiveEngineer = [];
  List _biomechanicalEngineer = [];
  List _controlsYSTEMSEngineer = [];
  List _photonicsEngineer = [];
  List _nanoEngineer = [];
  List _acousticEngineer = [];
  List _broadcastEngineer = [];
  List _facilitiesEngineer = [];
  List _manufacturingEngineer = [];
  List _pipingEngineer = [];
  List _reliabilityEngineer = [];
  List _fireSafetyEngineer = [];
  List _hvacEngineer = [];
  List _humanFactorsEngineer = [];
  List _packagingEngineer = [];
  List _processEngineer = [];
  List _qualityEngineer = [];
  List _remoteSensingEngineer = [];
  List _safetyEngineer = [];
  List _softwareQualityAssuranceEngineer = [];
  List _telecomNetworkEngineer = [];
  List _windEnergyEngineer = [];
  List _forensicEngineer = [];
  List _humanitarianEngineer = [];
  List _cybersecurityEngineer = [];
  List _energyEngineer = [];
  List _firmwareEngineer = [];
  List _gameDeveloper = [];
  List _instrumentationEngineer = [];
  List _laserEngineering = [];
  List _plumbingEngineer = [];
  List _quantumComptingEngineer = [];
  List _reverseEngineer = [];
  List _sustainableDesignEngineer = [];
  List _virtualRealityEngineer = [];
  List _graphicDesigner = [];
  List _nameImg = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _nameImg = data["subEng"];
      _desc = data["EngineerDescription"];
      _civilEngineer = data["civil engineer"];
      _mechanicalEngineer = data["mechanical engineer"];
      _electricalEngineer = data["electrical engineer"];
      _chemicalEngineer = data["chemical engineer"];
      _computerEngineer = data["computer engineer"];
      _aerospaceEngineer = data["aerospace engineer"];
      _biomedicalEngineer = data["biomedical engineer"];
      _environmentalEngineer = data["evironmental engineer"];
      _petroleumEngineer = data["petroleum engineer"];
      _industrialEngineer = data["industrial engineer"];
      _structuralEngineer = data["structural engineer"];
      _materialsEngineer = data["materials engineer"];
      _miningEngineer = data["mining engineer"];
      _geotechnicalEngineer = data["geotechincal engineer"];
      _nuclearEngineer = data["nuclear engineer"];
      _marineEngineer = data["marine engineer"];
      _roboticsEngineer = data["robotics engineer"];
      _systemsEngineer = data["systems engineer"];
      _softwareEngineer = data["software engineer"];
      _telecommunicationsEngineer = data["telecommunication engineer"];
      _trafficEngineer = data["traffic engineer"];
      _waterResourcesEngineer = data["water resource engineer"];
      _fireProtectionEngineer = data["fire protection engineer"];
      _railwayEngineer = data["railway engineer"];
      _renewableEnergyEngineer = data["renewable energy engineer"];
      _automotiveEngineer = data["automotive engineer"];
      _biomechanicalEngineer = data["biomechanical engineer"];
      _controlsYSTEMSEngineer = data["control systems engineer"];
      _photonicsEngineer = data["photonics engineer"];
      _nanoEngineer = data["nano engineer"];
      _acousticEngineer = data["acoustic  engineer"];
      _broadcastEngineer = data["broadcast engineer"];
      _facilitiesEngineer = data["facilities engineer"];
      _manufacturingEngineer = data["manufacturing engineer"];
      _pipingEngineer = data["piping engineer"];
      _reliabilityEngineer = data["reliability engineer"];
      _fireSafetyEngineer = data["fire safety engineer"];
      _hvacEngineer = data["HVAC engineer"];
      _humanFactorsEngineer = data["human factors engineer"];
      _packagingEngineer = data["packing engineer"];
      _processEngineer = data["process engineer"];
      _qualityEngineer = data["quality engineer"];
      _remoteSensingEngineer = data["remote sensing engineer"];
      _safetyEngineer = data["safety engineer"];
      _softwareQualityAssuranceEngineer =
          data["software quality assurance(SQA) engineer"];
      _telecomNetworkEngineer = data["telecom network engineer"];
      _windEnergyEngineer = data["wind energy engineer"];
      _forensicEngineer = data["forensic engineer"];
      _humanitarianEngineer = data["humanitarian engineer"];
      _cybersecurityEngineer = data["cybersecurity engineer"];
      _energyEngineer = data["energy engineer"];
      _firmwareEngineer = data["firmware engineer"];
      _gameDeveloper = data["game developer"];
      _instrumentationEngineer = data["instrumentation engineer"];
      _laserEngineering = data["laser engineer"];
      _plumbingEngineer = data["plumbing engineer"];
      _quantumComptingEngineer = data["quantum computing engineer"];
      _reverseEngineer = data["reverse engineer"];
      _sustainableDesignEngineer = data["sastainable design engineer"];
      _virtualRealityEngineer = data["virtual reality engineer"];
      _graphicDesigner = data["graphic desiner"];
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

  late List data = [
    _civilEngineer,
    _mechanicalEngineer,
    _electricalEngineer,
    _chemicalEngineer,
    _computerEngineer,
    _aerospaceEngineer,
    _biomedicalEngineer,
    _environmentalEngineer,
    _petroleumEngineer,
    _industrialEngineer,
    _structuralEngineer,
    _materialsEngineer,
    _miningEngineer,
    _geotechnicalEngineer,
    _nuclearEngineer,
    _marineEngineer,
    _roboticsEngineer,
    _systemsEngineer,
    _telecommunicationsEngineer,
    _trafficEngineer,
    _waterResourcesEngineer,
    _fireProtectionEngineer,
    _railwayEngineer,
    _renewableEnergyEngineer,
    _automotiveEngineer,
    _biomechanicalEngineer,
    _controlsYSTEMSEngineer,
    _photonicsEngineer,
    _nanoEngineer,
    _acousticEngineer,
    _broadcastEngineer,
    _facilitiesEngineer,
    _manufacturingEngineer,
    _pipingEngineer,
    _reliabilityEngineer,
    _fireSafetyEngineer,
    _hvacEngineer,
    _humanFactorsEngineer,
    _packagingEngineer,
    _processEngineer,
    _qualityEngineer,
    _remoteSensingEngineer,
    _safetyEngineer,
    _softwareQualityAssuranceEngineer,
    _telecomNetworkEngineer,
    _windEnergyEngineer,
    _forensicEngineer,
    _humanitarianEngineer,
    _cybersecurityEngineer,
    _energyEngineer,
    _firmwareEngineer,
    _gameDeveloper,
    _instrumentationEngineer,
    _laserEngineering,
    _plumbingEngineer,
    _quantumComptingEngineer,
    _reverseEngineer,
    _sustainableDesignEngineer,
    _virtualRealityEngineer,
    _graphicDesigner
  ];
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
                left: 10.w,
                top: 12.h,
                child: Text(
                  _nameImg[widget.i]['name'],
                  style: GoogleFonts.varela(
                      fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),

            Positioned(
              top: 18.h,
              left: 13.w,
              child: SizedBox(
                height: 55.h,
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
              top: 18.h,
              left: 6.w,
              child: SlideTransition(
                  position: _offsetAnimation!,
                  child: SizedBox(
                    height: 56.h,
                    width: 90.w,
                    child: Card(shape: const RoundedRectangleBorder(side: BorderSide(color:Color(0xff81B29A),width: 4 )),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'DESCRIPTION',
                                  style: GoogleFonts.varela(
                                      fontSize: 16.sp, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.all(8.sp),
                            child: Text(
                              '${_desc[widget.i]["description"]}',
                              style: GoogleFonts.varela(
                                  fontWeight: FontWeight.bold, fontSize: 14.sp),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            Positioned(
                top: 75.h,
                left: 30.w,
                child: Card(
                  color: const Color(0xffEE6C4D),
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
                top: 75.h,
                left: 60.w,
                child: Card(
                  color: const Color(0xffEE6C4D),
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
