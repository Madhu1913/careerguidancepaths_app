import 'package:careerguidancepaths_app/app/account/Provider/sharedPreferenceProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
// import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class myWorkSpace extends StatefulWidget {
  const myWorkSpace({super.key,});

  @override
  State<myWorkSpace> createState() => _myWorkSpaceState();
}

class _myWorkSpaceState extends State<myWorkSpace> {
  // final CountdownController _controller =
  // CountdownController(autoStart: true);
  int? time;
  int? showtimer;
  int? mainShowTimer;
  int? storedTime;
  final currentUser = FirebaseAuth.instance.currentUser!;
  Future storeTime()async{
    final prefs=await SharedPreferences.getInstance();
    prefs.setInt('time',time! );
    final retrievedTime=prefs.getInt('time');
    setState(() {
      storedTime=retrievedTime;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<sharedprefs>(
      builder:(context,value20,child)=> Scaffold(
        appBar: AppBar(
          title:  Text(
            'My WorkSpace',
            style: GoogleFonts.varela(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                letterSpacing: 1),
          ),
          elevation: 0,
          centerTitle: true,
          // backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed:(){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: const Text('Do you want to delete the workSpace'),
                  actions: [
                    ElevatedButton(onPressed: (){
                      FirebaseFirestore.instance
                          .collection('Users')
                          .doc(currentUser.uid)
                          .collection('WorkSpace')
                          .doc(currentUser.email).delete();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      }, child: const Text('Delete')),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text('Cancel'))
                  ],
                );
              });
      },icon:const Icon(Icons.delete))          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser.uid)
              .collection('WorkSpace')
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!['points'].length,
                  itemBuilder: (context, i) {
                    final points = snapshot.data!['points'];
                    return Padding(
                      padding:  EdgeInsets.all(4.sp),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              points[i],
                              style:  GoogleFonts.varela(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      final txt = TextEditingController();
                                      return AlertDialog(
                                        title: const Text('Add TASK'),
                                        content: TextFormField(
                                          controller: txt,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10))),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection('Users')
                                                    .doc(currentUser.uid)
                                                    .collection('WorkSpace')
                                                    .doc(currentUser.email)
                                                    .collection('${points[i]}')
                                                    .add({
                                                  '${points[i]}': txt.text.trim(),
                                                  'TimeStamp': Timestamp.now(),
                                                }).then((value) =>
                                                        print('Task Added'));
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Save')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'))
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.add_box),
                            ),
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(currentUser.uid)
                                  .collection('WorkSpace')
                                  .doc(currentUser.email)
                                  .collection('${points[i]}')
                                  .orderBy('TimeStamp', descending: false)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, idx) {
                                        final tasks = snapshot.data!.docs[idx];
                                         // bool? isDone=false;
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text('|',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                                            // Text('|',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 6.25.h,
                                                    child: Center(
                                                        child: Text(
                                                      '  --->',
                                                      style: GoogleFonts.varela(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 24.sp,
                                                          color: Colors.green),
                                                    )),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.all(4.sp),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  8)),
                                                      height: 6.25.h,
                                                      // width: 140,
                                                      child: Center(
                                                          child: Padding(
                                                            padding:   EdgeInsets.symmetric(horizontal: 16.sp),
                                                            child: Text(
                                                        '${tasks['${points[i]}']}',
                                                        style:  GoogleFonts.varela(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 14.sp,
                                                              color: Colors.white),
                                                      ),
                                                          )),
                                                    ),
                                                  ),
                                                  IconButton(onPressed: (){
                                                    showDialog(context: context, builder: (context){
                                                      final hr=TextEditingController();
                                                      final min=TextEditingController();
                                                      final sec=TextEditingController();
                                                      return AlertDialog(
                                                        title: const Text('Set Time'),
                                                        content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            // SizedBox(width: 90,),
                                                            SizedBox(height: 8.5.h,width: 8.3.h,
                                                              child: TextFormField(
                                                                controller: hr,
                                                                onChanged: (val){
                                                                  if(val.length==2){
                                                                    FocusScope.of(context).nextFocus();
                                                                  }
                                                                },
                                                                textAlign: TextAlign.center,
                                                                inputFormatters: [
                                                                  LengthLimitingTextInputFormatter(2),
                                                                  FilteringTextInputFormatter.digitsOnly
                                                                ],
                                                                decoration: InputDecoration(
                                                                 labelText: 'hr',
                                                                    border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(10)
                                                                    )
                                                                )
                                                                ,),),
                                                          SizedBox(height: 8.5.h,width:8.3.h,
                                                              child: TextFormField(
                                                                controller: min,
                                                                onChanged: (val){
                                                                if(val.length==2){
                                                                  FocusScope.of(context).nextFocus();
                                                                }
                                                                else if(val.isEmpty){
                                                                  FocusScope.of(context).previousFocus();
                                                                }
                                                              },
                                                                textAlign: TextAlign.center,
                                                                inputFormatters: [
                                                                  LengthLimitingTextInputFormatter(2),
                                                                  FilteringTextInputFormatter.digitsOnly
                                                                ],
                                                                decoration: InputDecoration(
                                                                  labelText: 'min',
                                                                    border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(10)
                                                                    )
                                                                )
                                                                ,),),
                                                        SizedBox(height: 8.5.h,width: 8.3.h,
                                                              child: TextFormField(
                                                                controller: sec,
                                                                onChanged: (val){
                                                                if(val.length==2){
                                                                  FocusScope.of(context).nextFocus();
                                                                }
                                                                else if(val.isEmpty){
                                                                  FocusScope.of(context).previousFocus();
                                                                }
                                                              },
                                                                textAlign: TextAlign.center,
                                                                inputFormatters: [
                                                                  LengthLimitingTextInputFormatter(2),
                                                                  FilteringTextInputFormatter.digitsOnly
                                                                ],
                                                                decoration: InputDecoration(
                                                                  labelText: 'sec',
                                                                    border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(10)
                                                                    )
                                                                )
                                                                ,),),
                                                          ],
                                                        ),
                                                        actions: [
                                                          ElevatedButton(onPressed: (){
                                                            if(hr.text.trim().isNotEmpty && min.text.trim().isNotEmpty && sec.text.trim().isNotEmpty){
                                                              setState(() {
                                                                time=int.parse(hr.text.trim())*3600+int.parse(min.text.trim())*60+int.parse(sec.text.trim());
                                                              });
                                                            }
                                                            storeTime();
                                                           // _controller.start();
                                                            Navigator.pop(context);
                                                          }, child: const Text('Set')),
                                                          ElevatedButton(onPressed: (){
                                                            Navigator.pop(context);

                                                          }, child: const Text('Cancel')),
                                                        ],
                                                      );
                                                    });
                                                    mainShowTimer=i;
                                                    showtimer=idx;
                                                  }, icon: const Icon(Icons.timer)),
                                                  time!=null && idx==showtimer && i==mainShowTimer ?Countdown(
                                                    // controller: _controller,
                                                    seconds: time!,
                                                    build: (_, double time) {
                                                      int timerTime=time.toInt();
                                                      int? hr;
                                                      int? hrRemain;
                                                      int? min;
                                                      int? minRemain;
                                                      int? sec;
                                                         hr=timerTime~/3600;
                                                         hrRemain=timerTime%3600;
                                                         min=hrRemain~/60;
                                                         minRemain=timerTime%60;
                                                         sec=minRemain;

                                                      return Text(
                                                       '$hr : $min : $sec',
                                                      style:  GoogleFonts.varela(fontSize: 14.sp,fontWeight: FontWeight.bold),
                                                    );
                                                     },
                                                    interval: const Duration(milliseconds: 100),
                                                    onFinished: () {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(
                                                          content: Text('Timer is done!'),
                                                        ),
                                                      );
                                                    },
                                                  ):Container(),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('${snapshot.error}'),
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              })
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
