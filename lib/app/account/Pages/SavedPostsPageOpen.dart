import 'package:careerguidancepaths_app/app/account/Pages/CommentsWriteAndReadPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/savedPosts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Provider/CPIprovider.dart';
import '../Provider/careerPointsDataProvider.dart';
import 'like.dart';
class MySavedPostsOnTap extends StatefulWidget {
  final String postid;
  const MySavedPostsOnTap({super.key, required this.postid});

  @override
  State<MySavedPostsOnTap> createState() => _MySavedPostsOnTapState();
}

class _MySavedPostsOnTapState extends State<MySavedPostsOnTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("UserPosts")
            .doc(widget.postid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              // scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, i) {
                  final post = snapshot.data!;
                  return Consumer2<cpiProvider, cpdProvider>(
                    builder:
                        (BuildContext context, value1, value2, Widget? child) =>
                        Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 20.w, top: 5.sp, bottom: 5.sp),
                                    child: Text(
                                      'Posted by @${post['userEmail']}',
                                      style: GoogleFonts.varela(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.sp, right: 8.sp),
                              child: Card(
                                color: Colors.grey[300],
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.0.sp, top: 10.sp),
                                          child: Card(
                                            color: Colors.redAccent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(10.sp)),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.sp),
                                              child: Text(
                                                post['careerName'],
                                                style: GoogleFonts.varela(
                                                    color: Colors.grey[100],
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: (4.6).h,
                                          width: 25.w,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15.sp),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(15.sp),
                                                child: InkWell(
                                                  onTap: () {
                                                    value2.imgShownet(context,
                                                        post["img"].toString());
                                                  },
                                                  child: Image.network(
                                                    post["img"].toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.sp),
                                          child: Text(
                                            'Career Points',
                                            style: GoogleFonts.varela(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3.0.sp),
                                      child: const Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 26.74.h,
                                      child: ListView.builder(
                                          itemCount: post['careerPoints'].length,
                                          itemBuilder: (context, i) {
                                            return Column(children: [
                                              Container(
                                                height: (6).h,
                                                width: 75.w,
                                                color: Colors.amberAccent,
                                                child: Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: (6.9).h),
                                                      child: Text(
                                                        post["careerPoints"][i],
                                                        style: GoogleFonts.varela(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    )),
                                              ),
                                              Icon(
                                                Icons.arrow_downward_outlined,
                                                size: 25.sp,
                                              )
                                            ]);
                                          }),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5.sp),
                                          child: Row(
                                            children: [
                                              likeButton(
                                                postid: post.id,
                                                likes: List<String>.from(
                                                    post['Likes'] ?? []),
                                              ),
                                              SizedBox(
                                                width: 15.sp,
                                              ),
                                              Text(
                                                List<String>.from(
                                                    post['Likes'] ?? [])
                                                    .length
                                                    .toString(),
                                                style: GoogleFonts.varela(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                writeAndReadComments(
                                                                  postid: post.id,
                                                                )));
                                                  },
                                                  icon: const Icon(Icons.comment))
                                            ],
                                          ),
                                        ),
                                        SavedPostsButton(
                                          postid: post.id,
                                          saves: List<String>.from(
                                              post['saves'] ?? []),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.sp),
                                          child: Text(
                                            'Description',
                                            style: GoogleFonts.varela(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3.0.sp),
                                      child: const Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                      child: SingleChildScrollView(
                                          child: Text(
                                            post["careerDescription"],
                                            style: GoogleFonts.varela(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp),
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.sp),
                                          child: Text(
                                            'Sources',
                                            style: GoogleFonts.varela(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3.0.sp),
                                      child: const Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          post["careerSources"] ==
                                              'No Sources Available'
                                              ? 'No Sources Available'
                                              : post["careerSources"]
                                              .join()
                                              .toString(),
                                          style: GoogleFonts.varela(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error :${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
