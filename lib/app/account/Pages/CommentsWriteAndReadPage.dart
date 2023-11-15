import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class writeAndReadComments extends StatefulWidget {
  final String postid;
  const writeAndReadComments({super.key, required this.postid});

  @override
  State<writeAndReadComments> createState() => _writeAndReadCommentsState();
}

class _writeAndReadCommentsState extends State<writeAndReadComments> {
  final commentController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;
  void addComment(String cmnt) async {
    await FirebaseFirestore.instance
        .collection('UserPosts')
        .doc(widget.postid)
        .collection('Comments')
        .add({
      'Comment': cmnt,
      'CommentedBy': currentUser.email,
      'TimeStamp': Timestamp.now()
    });
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser.uid)
        .collection('MyPosts')
        .doc(widget.postid)
        .collection('Comments')
        .add({
      'Comment': cmnt,
      'CommentedBy': currentUser.email,
      'TimeStamp': Timestamp.now()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 100,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('UserPosts')
                      .doc(widget.postid)
                      .collection('Comments')
                      .orderBy('TimeStamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
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
                                          style: GoogleFonts.varela(
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(3.sp),
                                          child: Row(
                                            children: [
                                              Text(
                                                cmnt['CommentedBy'],
                                                style: GoogleFonts.varela(
                                                    color: Colors.white),
                                              ),
                                              const Text(' . '),
                                              // Text(cmnt['TimeStamp'].toString()),
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
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: TextFormField(
                controller: commentController,
                decoration: InputDecoration(
                    hintText: 'Enter Here',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        addComment(commentController.text.trim());
                        commentController.clear();
                      },
                      icon: const Icon(Icons.send_rounded),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
