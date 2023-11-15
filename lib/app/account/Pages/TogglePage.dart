import 'package:careerguidancepaths_app/app/account/AddpathPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/like.dart';
import 'package:careerguidancepaths_app/app/account/Pages/savedPosts.dart';
import 'package:careerguidancepaths_app/app/account/Provider/CPIprovider.dart';
import 'package:careerguidancepaths_app/app/account/Provider/MyPathsProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'CommentsWriteAndReadPage.dart';

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const addPathPage()));
                  },
                  child: Icon(
                    Icons.add,
                    size: 10.h,
                  ),
                ),
              )
            : const MyPathsPage());
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
    return Scaffold(
      appBar: AppBar(title: Text('My Paths',style: GoogleFonts.varela(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22.sp),),backgroundColor: Colors.amber.shade300,elevation: 0,),
      body: StreamBuilder(
          stream: ref.orderBy('TimeStamp', descending: true).snapshots(),
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
                        Container(
                          height: 30.h,
                          width: 96.w,
                          decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              borderRadius: BorderRadius.circular(8.sp)),
                        ),
                        Positioned(left:5.w,top:1.75.h,child: Text(post['careerName'],style: GoogleFonts.varela(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.brown.shade800),)),
                        Positioned(left:10.w,top:6.75.h,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 7.5.h,
                                  width: 16.w,
                                  child: Card(
                                    elevation: 10,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(360),
                                        side:  BorderSide(
                                            color: Colors.amber.shade800,
                                            width: 2)),
                                    child: likeButton(
                                      postid: post.id,
                                      likes: List<String>.from(
                                          post['Likes'] ?? []),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 3.sp,
                                      top: 2.sp,
                                      bottom: 2.sp,
                                      right: 3.sp),
                                  child: Text(
                                    List<String>.from(
                                        post['Likes'] ?? [])
                                        .length
                                        .toString(),
                                    style: GoogleFonts.varela(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 2.sp),
                              child: SizedBox(
                                height: 7.5.h,
                                width: 16.w,
                                child: Card(
                                  shadowColor: Colors.black,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(360),
                                      side: BorderSide(
                                          color: Colors.amber.shade800,
                                          width: 2)),
                                  child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            shape:
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    20)),
                                            showDragHandle: true,
                                            context: context,
                                            builder: (context) {
                                              return SizedBox(
                                                height: 70.h,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                      StreamBuilder(
                                                          stream: FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                              'UserPosts')
                                                              .doc(post
                                                              .id)
                                                              .collection(
                                                              'Comments')
                                                              .orderBy(
                                                              'TimeStamp',
                                                              descending:
                                                              true)
                                                              .snapshots(),
                                                          builder:
                                                              (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return ListView.builder(
                                                                  itemCount: snapshot.data!.docs.length,
                                                                  itemBuilder: (context, i) {
                                                                    final cmnt = snapshot.data!.docs[i];
                                                                    return Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsets.all(8.sp),
                                                                          child: Container(
                                                                            color: Colors.grey,
                                                                            child: Column(
                                                                              children: [
                                                                                Text(
                                                                                  cmnt['Comment'],
                                                                                  style: GoogleFonts.varela(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w400),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsets.all(3.sp),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Text(
                                                                                        cmnt['CommentedBy'],
                                                                                        style: GoogleFonts.varela(color: Colors.white),
                                                                                      ),
                                                                                      const Text(' . '),
                                                                                      // Text(cmnt['TimeStamp'].toString().split('.')[0]),
                                                                                    ],
                                                                                  ),
                                                                                ),

                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 10,
                                                                        )
                                                                      ],
                                                                    );
                                                                  });
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Center(
                                                                child:
                                                                Text('${snapshot.error}'),
                                                              );
                                                            }
                                                            return const Center(
                                                              child:
                                                              CircularProgressIndicator(),
                                                            );
                                                          }),
                                                    ),
                                                    Hero(
                                                      tag:100,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => writeAndReadComments(
                                                                    postid: post.id,
                                                                  ),)).then((value) {
                                                              Navigator.pop(context);
                                                            });
                                                          },
                                                          child: const Text(
                                                              'Do Comment')),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.comment)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 4.sp),
                              child: SizedBox(
                                height: 7.5.h,
                                width: 16.w,
                                child: Card(
                                  shadowColor: Colors.black,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(360),
                                      side:  BorderSide(
                                          color: Colors.amber.shade800,
                                          width: 2)),
                                  child: SavedPostsButton(
                                    postid: post.id,
                                    saves: List<String>.from(
                                        post['saves'] ?? []),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                        Positioned(left:40.w,top:6.h,child: Container(height:20.h,width:40.w,child: ClipRRect(borderRadius:BorderRadius.circular(10),child: Image.network(post["img"].toString(),fit: BoxFit.cover,)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),))
                      ]),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
