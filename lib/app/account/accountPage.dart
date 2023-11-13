import 'dart:typed_data';
import 'dart:ui';
import 'package:careerguidancepaths_app/app/account/AddpathPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/EditPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/MyWorkSpace.dart';
import 'package:careerguidancepaths_app/app/account/Pages/SavedPostsPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/TogglePage.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/PostedPathsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatefulWidget {
  bool img;
  AccountPage({super.key,required this.img});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  Uint8List? profilePic;
  String? item;
  pickImage() async {
    XFile? imgfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imgfile != null) {
      return imgfile.readAsBytes();
    }
  }

  void selectImage() async {
    Uint8List image = await pickImage();
    setState(() {
      profilePic = image;
    });
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentuser.uid)
        .collection('Profile')
        .doc(currentuser.email)
        .set({'img': profilePic?.join('.').toString()}).then(
            (value){
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(currentuser.uid)
                  .snapshots(),
              builder:(context,snapshot) {
                if(snapshot.hasData){
                  final userdata = snapshot.data!.data() as Map<String, dynamic>;
                  return Stack(children: [
                    Container(
                      child: CustomPaint(
                        size: Size(
                            100.w,
                            (100.w * 2.0)
                                .toDouble()),
                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                    ),
                    Positioned(
                        left: 20.w,
                        top: 5.sp,
                        child: Text('CAREER CATALYST',style: GoogleFonts.varela(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 26),)),
                    Positioned(
                        left: 14.sp,
                        top: 6.28.h,
                        child: Container(
                          height: 19.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              color: Colors.white),
                          // child: Image.network(''),
                        )),
                    Positioned(
                        left: 21.sp,
                        top: 7.3.h,
                        child: CircleAvatar(
                          radius: 70,
                          child:  AspectRatio(
                            aspectRatio: 1,
                            child: widget.img
                                ? StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(currentuser.uid)
                                    .collection('Profile')
                                    .doc(currentuser.email)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final data = snapshot.data!;
                                    final String one =
                                    data['img'];
                                    var imgvarlist = one
                                        .split('.')
                                        .map((one) =>
                                        int.parse(one))
                                        .toList();
                                    final Uint8List myimg =
                                    Uint8List.fromList(
                                        imgvarlist);
                                    return ClipRRect(borderRadius: BorderRadius.circular(360),
                                      child: Image(
                                        image: MemoryImage(myimg),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                          '${snapshot.error}'),
                                    );
                                  }
                                  return const Center(
                                    child:
                                    CircularProgressIndicator(),
                                  );
                                })
                                : ClipRRect(borderRadius: BorderRadius.circular(360),
                                  child: const Image(
                              image: NetworkImage(
                                    'https://th.bing.com/th?id=OIP.SxuyKL-Ca-_bXp1TC4c4-gHaF3&w=280&h=222&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                              fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                            ),
                                ),
                          )
                          // child: Image.network(''),
                        )),
                    Positioned(
                        left: 16.25.h,
                        top: 19.h,
                        child: Card(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(360)),
                            child: IconButton(
                              onPressed: () async {
                                selectImage();
                                setState(() {
                                  widget.img=true;
                                });
                              },icon: const Icon(Icons.image,color: Colors.red,),))),
                    Positioned(
                        left: 32.5.w,
                        top: 32.h,
                        child: SizedBox(
                          height: 37.5.h,
                          width: 60.w,
                          child: Card(
                            // color: Colors.red,
                            shadowColor: Colors.red,
                            elevation: 15.sp,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.red, width: 10),
                                borderRadius: BorderRadius.circular(25.sp)),
                            child: Column(
                              children: [
                                SizedBox(height: 15.sp,),
                                Text('DETAILS', style: GoogleFonts.varela(fontSize: 20.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700),),
                                const SizedBox(height: 5,),
                                Container(height: 2,
                                  width: 60.w,
                                  color: Colors.red,),
                                Padding(
                                  padding: EdgeInsets.all(7.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                        children: [
                                          SizedBox(height: 6.23.h,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Card(color: Colors.red,
                                                    child: Center(child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets
                                                              .all(4.sp),
                                                          child: Text(
                                                            ' NAME :   ${userdata['userName']} ',
                                                            style: GoogleFonts.varela(
                                                                fontSize: 13.sp,
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                color: Colors
                                                                    .white),),
                                                        ),
                                                      ],
                                                    ))),
                                              )),
                                          SizedBox(height: 6.23.h,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Card(color: Colors.red,
                                                    child: Center(child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets
                                                              .all(4.sp),
                                                          child: Text(
                                                            ' AGE :   ${userdata['age']} ',
                                                            style: GoogleFonts.varela(
                                                                fontSize: 13.sp,
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                color: Colors
                                                                    .white),),
                                                        ),
                                                      ],
                                                    ))),
                                              )),
                                          SizedBox(height: 6.23.h,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Card(color: Colors.red,
                                                    child: Center(child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets
                                                              .all(4.sp),
                                                          child: Text(
                                                            ' JOB :   ${userdata['occupation']} ',
                                                            style: GoogleFonts.varela(
                                                                fontSize: 13.sp,
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                color: Colors
                                                                    .white),),
                                                        ),
                                                      ],
                                                    ))),
                                              )),
                                          Padding(
                                            padding: EdgeInsets.only(left: 9.h),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const editPage()));
                                            },
                                                child: Text('EDIT',style: GoogleFonts.varela(fontWeight: FontWeight.bold,fontSize: 20),)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      left: 5.w,
                      top: 71.h,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Card(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(360)),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>  const addPathPage()));
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    size: 25.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyPathsPage()));
                                },
                                child: SizedBox(
                                    height: 6.23.h,
                                    width: 30.w,
                                    child: Card(color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.sp)),
                                      child: Center(child: Text('MyPaths',
                                        style: GoogleFonts.varela(fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Colors.white),)),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const savedPostsPage()));
                                },
                                child: SizedBox(
                                    height: 6.23.h,
                                    width: 25.w,
                                    child: Card(
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.sp)),
                                      child: Center(child: Text('Saved',
                                        style: GoogleFonts.varela(fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: Colors.white),),),
                                    )),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Card(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(360)),
                                child: IconButton(
                                    onPressed: () async {
                                      final data = await FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(currentuser.uid)
                                          .collection('WorkSpace')
                                          .doc(currentuser.email)
                                          .get();
                                      if (data.exists) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const myWorkSpace()));
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('WorkSpace is Empty'),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                const postedPathsPage())).then(
                                                                (value) {
                                                              Navigator.pop(context);
                                                            });
                                                      },
                                                      child: const Text('Add')),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('Cancel'))
                                                ],
                                              );
                                            });
                                      }
                                    },
                                    icon: const Icon(Icons.work,color: Colors.white,)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]);
                }else if(!snapshot.hasData){
                  return const Center(child: Text('NOTHING HERE'));
                }else if(snapshot.hasError){
                  return Center(child: Text('${snapshot.error}'),);
                }
                return const Center(child: CircularProgressIndicator(),);
              }
          )),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Circle

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 231, 18, 18)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0036500, size.height * 0.0010000);
    path_1.cubicTo(
        size.width * 0.0536500,
        size.height * 0.0013250,
        size.width * 0.9536750,
        size.height * 0.0004750,
        size.width * 0.9963500,
        size.height * 0.0006750);
    path_1.cubicTo(
        size.width * 1.0334750,
        size.height * 0.6934125,
        size.width * 0.8872000,
        size.height * -0.0372625,
        size.width * 0.7265750,
        size.height * 0.0892500);
    path_1.cubicTo(
        size.width * 0.5681250,
        size.height * 0.2128250,
        size.width * -0.0020000,
        size.height * 0.6522500,
        size.width * 0.0020000,
        size.height * 0.5675000);
    path_1.cubicTo(
        size.width * 0.0020000,
        size.height * 0.5425000,
        size.width * -0.0139000,
        size.height * 0.0110000,
        size.width * 0.0036500,
        size.height * 0.0010000);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Circle

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paint_stroke_1);

    // Circle Copy
    //
    // Paint paint_fill_2 = Paint()
    //   ..color = const Color.fromARGB(255, 231, 18, 18)
    //   ..style = PaintingStyle.fill
    //   ..strokeWidth = size.width*0.00
    //   ..strokeCap = StrokeCap.butt
    //   ..strokeJoin = StrokeJoin.miter;
    //
    //
    // Path path_2 = Path();
    // path_2.moveTo(size.width*0.6196500,size.height*1.0014000);
    // path_2.cubicTo(size.width*0.8416250,size.height*0.9986875,size.width*0.9586250,size.height*0.9000625,size.width*0.9972500,size.height*0.9940625);
    // path_2.cubicTo(size.width*0.9135250,size.height*1.0173000,size.width*0.8105000,size.height*0.9890250,size.width*0.8773000,size.height*0.8469750);
    // path_2.cubicTo(size.width*0.9842000,size.height*0.6953125,size.width*1.0069000,size.height*0.4051750,size.width*1.0019750,size.height*0.8022375);
    // path_2.cubicTo(size.width*0.9701750,size.height*0.9425500,size.width*0.3466250,size.height*0.9941750,size.width*0.6196500,size.height*1.0014000);
    // path_2.close();
    //
    // canvas.drawPath(path_2, paint_fill_2);
    //
    //
    // // Circle Copy
    //
    // Paint paint_stroke_2 = Paint()
    //   ..color = const Color.fromARGB(255, 33, 150, 243)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width*0.00
    //   ..strokeCap = StrokeCap.butt
    //   ..strokeJoin = StrokeJoin.miter;
    //
    //
    //
    // canvas.drawPath(path_2, paint_stroke_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
