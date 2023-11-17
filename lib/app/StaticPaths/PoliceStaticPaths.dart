import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class policeStaticPaths extends StatefulWidget {
  final int i;
  const policeStaticPaths({super.key, required this.i});

  @override
  State<policeStaticPaths> createState() => _policeStaticPathsState();
}

class _policeStaticPathsState extends State<policeStaticPaths> with SingleTickerProviderStateMixin{
  List _policeOfficer = [];
  List _detective = [];
  List _criminalInvestigator = [];
  List _swatOfficer = [];
  List _k9Officer = [];
  List _trafficOfficer = [];
  List _narcoticsDetective = [];
  List _homicideDetective = [];
  List _cyberCrimeDetective = [];
  List _crimeSceneInvestigator = [];
  List _fbiAgent = [];
  List _deaAgent = [];
  List _atfAgent = [];
  List _borderPatrolAgent = [];
  List _secretServiceAgent = [];
  List _marshals = [];
  List _stateTroop = [];
  List _transitPoliceOfficer = [];
  List _schoolResourceOfficer = [];
  List _communityPolicingOfficer = [];
  List _specialVictimsUnit = [];
  List _gangUnitOfficer = [];
  List _hostageNegotiator = [];
  List _intelligenceAnalyst = [];
  List _internalAffairsInvestigator = [];
  List _crisisInterVentionOfficer = [];
  List _underCoverOfficer = [];
  List _harborPatrolOfficer = [];
  List _parkRanger = [];
  List _mountedPoliceOfficer = [];
  List _tacticalMedic = [];
  List _publicInformationOfficer = [];
  List _emergencyResponseTeam = [];
  List _counterterrorismUnitOfficer = [];
  List _evidenceCustodian = [];
  List _marinePatrolOfficer = [];
  List _animalControlOfficer = [];
  List _forensicSketchArtist = [];
  List _hostageRescueTeam = [];
  List _behavioralAnalysisUnit = [];
  List _computerForensicAnalyst = [];
  List _polygraphExaminer = [];
  List _coldCaseDetective = [];
  List _policeChaplian = [];
  List _crimePreventionOfficer = [];
  List _searchAndRescueOfficer = [];
  List _juvenileDetective = [];
  List _underwaterRecoveryTeam = [];
  List _crisisNegotiationTeam = [];
  List _fraudInvestigator = [];
  List _nameImg=[];
  List _desc=[];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _nameImg=data["subPol"];
      _policeOfficer = data["policeOfficer"];
      _detective = data["detective"];
      _criminalInvestigator = data["Criminal investigator"];
      _swatOfficer = data["SWAT Officer"];
      _k9Officer = data["K-9 Officer (Canine Unit)"];
      _trafficOfficer = data["Traffic Officer"];
      _narcoticsDetective = data["Narcotics detective"];
      _homicideDetective = data["Homicide detective "];
      _cyberCrimeDetective = data["Cybercrime detective"];
      _crimeSceneInvestigator = data["Crime Scene Investigator (CSI) "];
      _fbiAgent = data["FBI (Federal Bureau of Investigation) agent"];
      _deaAgent = data["DEA (Drug Enforcement Administration) agent"];
      _atfAgent = data[
          "ATF (Bureau of Alcohol, Tobacco, Firearms, and Explosives) agent"];
      _borderPatrolAgent = data[
          "Border Patrol Agent with the U.S. Customs and Border Protection (CBP) "];
      _secretServiceAgent = data["Secret Service Agent "];
      _marshals = data["U.S. Marshals Service"];
      _stateTroop = data["state trooper "];
      _transitPoliceOfficer = data["Transit Police Officer "];
      _schoolResourceOfficer = data["School Resource Officer (SRO)"];
      _communityPolicingOfficer = data["Community Policing Officer"];
      _specialVictimsUnit = data["Special Victims Unit (SVU) Detective"];
      _gangUnitOfficer = data["Gang Unit Officer"];
      _hostageNegotiator = data["Hostage Negotiator"];
      _intelligenceAnalyst = data["Intelligence Analyst"];
      _internalAffairsInvestigator = data["Internal Affairs Investigator "];
      _crisisInterVentionOfficer = data["Crisis Intervention Team (CIT) "];
      _underCoverOfficer = data["Undercover Officer"];
      _harborPatrolOfficer = data["Harbor Patrol Officer "];
      _parkRanger = data["Park Ranger "];
      _mountedPoliceOfficer = data["Mounted Police Officer"];
      _tacticalMedic = data["Tactical Medic"];
      _publicInformationOfficer = data["Public Information Officer (PIO) "];
      _emergencyResponseTeam = data["Emergency Response Team (ERT) Officer  "];
      _counterterrorismUnitOfficer = data["Counterterrorism Unit Officer  "];
      _evidenceCustodian = data["Evidence Custodian "];
      _marinePatrolOfficer = data["Marine Patrol Officer "];
      _animalControlOfficer = data["Animal Control Officer"];
      _forensicSketchArtist = data["forensic sketch artist "];
      _hostageRescueTeam = data["Hostage Rescue Team (HRT)  "];
      _behavioralAnalysisUnit = data["Behavioral Analysis Unit (BAU) Agent"];
      _computerForensicAnalyst = data["Computer Forensic Analyst "];
      _polygraphExaminer = data["Polygraph Examiner "];
      _coldCaseDetective = data["Cold Case Detective  "];
      _policeChaplian = data["Police Chaplain"];
      _crimePreventionOfficer = data["Crime Prevention Officer "];
      _searchAndRescueOfficer = data["Search and Rescue Officer "];
      _juvenileDetective = data["Juvenile Detective"];
      _underwaterRecoveryTeam = data["Underwater Recovery Team "];
      _crisisNegotiationTeam = data["Crisis Negotiation Team (CNT)"];
      _fraudInvestigator = data["Fraud investigator  "];
      _desc=data["PoliceDescription"];
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
    _policeOfficer,
    _detective,
    _criminalInvestigator,
    _swatOfficer,
    _k9Officer,
    _trafficOfficer,
    _narcoticsDetective,
    _homicideDetective,
    _cyberCrimeDetective,
    _crimeSceneInvestigator,
    _fbiAgent,
    _deaAgent,
    _atfAgent,
    _borderPatrolAgent,
    _secretServiceAgent,
    _marshals,
    _stateTroop,
    _transitPoliceOfficer,
    _schoolResourceOfficer,
    _communityPolicingOfficer,
    _specialVictimsUnit,
    _gangUnitOfficer,
    _hostageNegotiator,
    _intelligenceAnalyst,
    _internalAffairsInvestigator,
    _crisisInterVentionOfficer,
    _underCoverOfficer,
    _harborPatrolOfficer,
    _parkRanger,
    _mountedPoliceOfficer,
    _tacticalMedic,
    _publicInformationOfficer,
    _emergencyResponseTeam,
    _counterterrorismUnitOfficer,
    _evidenceCustodian,
    _marinePatrolOfficer,
    _animalControlOfficer,
    _forensicSketchArtist,
    _hostageRescueTeam,
    _behavioralAnalysisUnit,
    _computerForensicAnalyst,
    _polygraphExaminer,
    _coldCaseDetective,
    _policeChaplian,
    _crimePreventionOfficer,
    _searchAndRescueOfficer,
    _juvenileDetective,
    _underwaterRecoveryTeam,
    _crisisNegotiationTeam,
    _fraudInvestigator
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Positioned(
            //   left: 26.w,
            //   child: Container(
            //     height: 32.5.h,
            //     width: 50.w,
            //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
            //         image: DecorationImage(
            //           image: NetworkImage(_nameImg[widget.i]['url']),
            //         )),
            //   ),
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
                left: 16.w,
                top: 13.5.h,
                child: Text(
                  _nameImg[widget.i]['name'],
                  style: GoogleFonts.varela(
                      fontWeight: FontWeight.bold, fontSize: 24),
                )),
            // Positioned(left: 11.w,top:17.h,child: Container(color: Colors.yellow,height: 0.4.h,width: 60.w,)),

            Positioned(
              top: 19.h,
              left: 13.w,
              child: SizedBox(
                height: 51.h,
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
                              color: const Color(0xff81B29A),
                              child: Center(
                                  child: Text(
                                    '${myList[i]['point']}',
                                    style: GoogleFonts.varela(
                                        fontSize: 14.sp,
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
              top: 19.h,
              left: 8.w,
              child: SlideTransition(
                  position: _offsetAnimation!,
                  child: SizedBox(
                    height: 52.h,
                    width: 79.w,
                    child: Card(shape: const RoundedRectangleBorder(side: BorderSide(color:Color(0xff81B29A),width: 4 )),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('DESCRIPTION',style: GoogleFonts.varela(fontSize: 24,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding:  EdgeInsets.all(8.0.sp),
                            child: Text('${_desc[widget.i]["description"]}',style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 14.sp),textAlign: TextAlign.justify,),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
            Positioned(
                top: 74.h,
                left: 25.w,
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
                top: 74.h,
                left: 45.w,
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

