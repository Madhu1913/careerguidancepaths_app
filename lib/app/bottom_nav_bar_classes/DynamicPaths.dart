import 'package:careerguidancepaths_app/app/account/Pages/CommentsWriteAndReadPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/like.dart';
import 'package:careerguidancepaths_app/app/account/Pages/savedPosts.dart';
import 'package:careerguidancepaths_app/app/account/Provider/CPIprovider.dart';
import 'package:careerguidancepaths_app/app/account/Provider/careerPointsDataProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class dynamicPaths extends StatefulWidget {
  const dynamicPaths({super.key});

  @override
  State<dynamicPaths> createState() => _dynamicPathsState();
}

class _dynamicPathsState extends State<dynamicPaths> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isSaved = false;
  String? item;
  PageController controller = PageController();
  double currentPageValue = 0.0;
  final con = FlipCardController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,elevation: 0,title: Text('All Paths',style: GoogleFonts.varela(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.bold
        ),),),
        body: Consumer2<cpiProvider, cpdProvider>(
            builder: (context, value1, value2, child) {
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('UserPosts')
                .orderBy('TimeStamp',descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const Expanded(flex:2,child: SizedBox()),
                    Expanded(flex: 25,
                      child: PageView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            final post = snapshot.data!.docs[i];
                            return Transform(
                                transform: Matrix4.identity()
                                  ..rotateX(currentPageValue - i),
                                child: Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: Card(
                                    // color: Colors.grey,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 50.h,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
                                                      side: const BorderSide(
                                                          color: Colors.black,
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
                                              SizedBox(
                                                height: 7.5.h,
                                                width: 16.w,
                                                child: Card(
                                                  shadowColor: Colors.black,
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(360),
                                                      side: const BorderSide(
                                                          color: Colors.black,
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
                                                                                                    )
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
                                              SizedBox(
                                                height: 2.5.h,
                                              ),
                                              SizedBox(
                                                height: 7.5.h,
                                                width: 16.w,
                                                child: Card(
                                                  elevation: 10,
                                                  shadowColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(360),
                                                      side: const BorderSide(
                                                          color: Colors.black,
                                                          width: 2)),
                                                  child: IconButton(
                                                      onPressed: () async {
                                                        final data =
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection('Users')
                                                                .doc(currentUser.uid)
                                                                .collection('WorkSpace')
                                                                .doc(currentUser.email)
                                                                .get();
                                                        if (data.exists) {
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(SnackBar(
                                                            content: Text(
                                                              'WorkSpace is not empty',
                                                              style: GoogleFonts.varela(
                                                                  fontSize: 13.sp,
                                                                  color: Colors.black),
                                                            ),
                                                            backgroundColor:
                                                                Colors.greenAccent,
                                                            behavior: SnackBarBehavior
                                                                .floating,
                                                          ));
                                                        } else {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection('Users')
                                                              .doc(currentUser.uid)
                                                              .collection('WorkSpace')
                                                              .doc(currentUser.email)
                                                              .set({
                                                            'points':
                                                                post["careerPoints"]
                                                          }).then((value) =>
                                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to WorkSPace'),behavior: SnackBarBehavior.floating,)));
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.add_home_work)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.5.h,
                                              ),
                                              SizedBox(
                                                height: 7.5.h,
                                                width: 16.w,
                                                child: Card(
                                                  shadowColor: Colors.black,
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(360),
                                                      side: const BorderSide(
                                                          color: Colors.black,
                                                          width: 2)),
                                                  child: SavedPostsButton(
                                                    postid: post.id,
                                                    saves: List<String>.from(
                                                        post['saves'] ?? []),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.5.h,
                                              ),
                                              SizedBox(
                                                height: 7.5.h,
                                                width: 16.w,
                                                child: Card(
                                                  shadowColor: Colors.black,
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(360),
                                                      side: const BorderSide(
                                                          color: Colors.black,
                                                          width: 2)),
                                                  child: IconButton(onPressed: (){
                                                    setState(() {
                                                      con.flipcard();
                                                    });
                                                  },icon: const Icon(Icons.flip),)
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.sp)),
                                            elevation: 10,
                                            shadowColor: Colors.black,
                                            // color: Theme.of(context).colorScheme.secondaryContainer,
                                            child: Padding(
                                              padding: EdgeInsets.all(2.sp),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    // con.flipcard();
                                                  });
                                                },
                                                child: FlipCard(
                                                    controller: con,
                                                    rotateSide: RotateSide.right,
                                                    axis: FlipAxis.vertical,
                                                    animationDuration: const Duration(
                                                        milliseconds: 300),
                                                    frontWidget: Column(
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets.symmetric(vertical: 8.sp),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.spaceAround,
                                                            children: [
                                                              Card(
                                                                // color: Colors.redAc,
                                                                shape:
                                                                    RoundedRectangleBorder(side: const BorderSide(color: Colors.black),
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                    10.sp)),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(
                                                                      5.sp),
                                                                  child: Text(
                                                                    post['careerName'],
                                                                    style: GoogleFonts
                                                                        .varela(
                                                                            // color: Colors
                                                                            //         .grey[
                                                                            //     100],
                                                                            fontSize:
                                                                                20.sp,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                                width: 20.w,
                                                                child: Card(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                360),
                                                                  ),
                                                                  child: ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  360),
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          value2.imgShownet(
                                                                              context,
                                                                              post["img"]
                                                                                  .toString());
                                                                        },
                                                                        child:
                                                                            Image.network(
                                                                          post["img"]
                                                                              .toString(),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      )),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          13.sp),
                                                              child: Text(
                                                                'Career Points',
                                                                style:
                                                                    GoogleFonts.varela(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20.sp),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(3.0.sp),
                                                          child: const Divider(
                                                            height: 2,
                                                            thickness: 2,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(height: 1.h,),
                                                        SizedBox(
                                                          height: 40.h,
                                                          child: ListView.builder(
                                                              itemCount:
                                                                  post['careerPoints']
                                                                      .length,
                                                              itemBuilder:
                                                                  (context, i) {
                                                                return Column(
                                                                    children: [
                                                                      Container(
                                                                        height: (6).h,
                                                                        width: 60.w,
                                                                        decoration: BoxDecoration(color:  Theme.of(context).colorScheme.secondaryContainer
                                                                            ,borderRadius: BorderRadius.circular(20.sp)),
                                                                        child: Center(
                                                                            child:
                                                                                Padding(
                                                                          padding: EdgeInsets
                                                                              .symmetric(
                                                                                  horizontal:
                                                                                      (6).h),
                                                                          child: Text(
                                                                            post["careerPoints"]
                                                                                [i],
                                                                            style: GoogleFonts.varela(
                                                                                fontSize: 15
                                                                                    .sp,
                                                                                color: Theme.of(context).colorScheme.background,
                                                                                fontWeight:
                                                                                    FontWeight.bold),
                                                                          ),
                                                                        )),
                                                                      ),
                                                                      i!=post["careerPoints"].length-1?Icon(
                                                                        Icons
                                                                            .arrow_downward_outlined,
                                                                        size: 25.sp,color: Theme.of(context).colorScheme.primaryContainer,
                                                                      ):Container()
                                                                    ]);
                                                              }),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(7.sp),
                                                          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
                                                            child: Padding(
                                                              padding:  EdgeInsets.all(2.sp),
                                                              child: Text(
                                                                post['careerName'],
                                                                style: GoogleFonts.varela(
                                                                    fontSize: 24.sp,
                                                                    // color: Theme.of(context).colorScheme.background
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    backWidget: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Card(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .symmetric(
                                                                              horizontal:
                                                                                  13.sp),
                                                                      child: Text(
                                                                        'Description',
                                                                        style: GoogleFonts.varela(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                            fontSize:
                                                                                20.sp),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets.all(
                                                                          3.sp),
                                                                  child: const Divider(
                                                                    height: 2,
                                                                    thickness: 2,
                                                                    color: Colors.black,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 26.h,
                                                                  child:
                                                                      SingleChildScrollView(
                                                                          child: Text(
                                                                    post[
                                                                        "careerDescription"],
                                                                    style: GoogleFonts
                                                                        .varela(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                            fontSize:
                                                                                12.sp),
                                                                  )),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Card(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .symmetric(
                                                                              horizontal:
                                                                                  13.sp),
                                                                      child: Text(
                                                                        'Sources',
                                                                        style: GoogleFonts.varela(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                            fontSize:
                                                                                19.sp),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets.all(
                                                                          3.0.sp),
                                                                  child: const Divider(
                                                                    height: 2,
                                                                    thickness: 2,
                                                                    color: Colors.black,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 26.h,
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child: Text(
                                                                      post["careerSources"] ==
                                                                              'No Sources Available'
                                                                          ? 'No Sources Available'
                                                                          : post["careerSources"]
                                                                              .join()
                                                                              .toString(),
                                                                      style: GoogleFonts.varela(
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ),
                    const Expanded(flex: 2,child: SizedBox(),)
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }),
      ),
    );
  }
}
