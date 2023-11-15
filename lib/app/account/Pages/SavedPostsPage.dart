import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'SavedPostsPageOpen.dart';

class savedPostsPage extends StatefulWidget {
  const savedPostsPage({super.key});

  @override
  State<savedPostsPage> createState() => _savedPostsPageState();
}

class _savedPostsPageState extends State<savedPostsPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Posts',
          style: GoogleFonts.varela(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        ),
        backgroundColor: Colors.orangeAccent.shade100,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser.uid)
            .collection('SavedPosts')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  final savedPostsDocs = snapshot.data!.docs[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MySavedPostsOnTap(
                                    postid: savedPostsDocs.id,
                                  )));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.sp, vertical: 5.sp),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.sp),
                        child: Container(
                          // height: 40.h,
                          // width: 45.w,
                          color: Colors.redAccent,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 6.h,
                                  width: 40.w,
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.sp),
                                      child: Text(
                                        savedPostsDocs['careerName'],
                                        style: GoogleFonts.varela(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                  child: Card(
                                    child: Image.network(
                                      savedPostsDocs['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     SavedPostsButton(postid: savedPostsDocs.id,  saves: List<String>.from(
                                //         savedPostsDocs['saves'] ?? []),)
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
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
    );
  }
}
