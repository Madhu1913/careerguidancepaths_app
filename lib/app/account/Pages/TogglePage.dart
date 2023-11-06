import 'package:careerguidancepaths_app/app/account/AddpathPage.dart';
import 'package:careerguidancepaths_app/app/account/Provider/CPIprovider.dart';
import 'package:careerguidancepaths_app/app/account/Provider/MyPathsProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class togglePages extends StatefulWidget {
  const togglePages({super.key});

  @override
  State<togglePages> createState() => _togglePagesState();
}

class _togglePagesState extends State<togglePages> {
  @override
  Widget build(BuildContext context) {
    return Consumer<myPathsProvider>(
        builder: (context, value, child) => value.togglenum == false
            ? Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addPathPage()));
                  },
                  child: Icon(
                    Icons.add,
                    size: 10.h,
                  ),
                ),
              )
            : MyPathsPage());
  }
}

class MyPathsPage extends StatefulWidget {
  const MyPathsPage({super.key});

  @override
  State<MyPathsPage> createState() => _MyPathsPageState();
}

class _MyPathsPageState extends State<MyPathsPage> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  late final ref = FirebaseFirestore.instance
      .collection('Users')
      .doc(currentuser.uid)
      .collection('MyPosts');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.orderBy('TimeStamp', descending: false).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  final post = snapshot.data!.docs[i];
                  return Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Stack(children: [
                      Consumer<cpiProvider>(
                        builder: (context, value1, child) => Container(
                          height: 10.h,
                          width: 95.w,
                          child: Image.network(
                                  post["img"].toString(),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                        ),
                      ),
                      Text(
                        post['careerName'],
                        style: GoogleFonts.varela(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      Positioned(
                        left: 86.w,
                        child: Consumer<cpiProvider>(
                            builder:(context,value,child)=> IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: ()  async{
                                await FirebaseFirestore.instance.collection('Users').doc(currentuser.uid).collection('MyPosts')
                                    .doc(post.id)
                                    .delete()
                                    .then((value) => print('deleted'));
                                await FirebaseFirestore.instance
                                    .collection('UserPosts')
                                    .doc(post.id)
                                    .delete()
                                    .then((value) => print('deleted'));
                              }),
                        ),
                      )
                    ]),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
