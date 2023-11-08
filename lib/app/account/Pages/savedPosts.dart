import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SavedPostsButton extends StatefulWidget {
  final String postid;
  final List saves;

  SavedPostsButton({
    super.key,
    required this.postid, required this.saves,
  });

  @override
  State<SavedPostsButton> createState() => _SavedPostsButtonState();
}

class _SavedPostsButtonState extends State<SavedPostsButton> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isSaved = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSaved = widget.saves.contains(currentUser.email);
  }

  Future save() async {
    setState(() {
      isSaved = !isSaved;
    });
    DocumentReference postRef =
    FirebaseFirestore.instance.collection('UserPosts').doc(widget.postid);
    DocumentReference MyPostRef =
    FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).collection('MyPosts').doc(widget.postid);
    final document = FirebaseFirestore.instance
        .collection('UserPosts')
        .doc(widget.postid);

    DocumentSnapshot snapshot = await document.get();
    if (isSaved) {
      postRef.update({
        'saves': FieldValue.arrayUnion([currentUser.email])
      });
      MyPostRef.update({
        'saves': FieldValue.arrayUnion([currentUser.email])
      });
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser.uid)
          .collection('SavedPosts')
          .doc(widget.postid)
          .set(data).then((value) {
            //print('added to saved posts');
      });
    }else{
      postRef.update({
        'saves': FieldValue.arrayRemove([currentUser.email])
      });
      MyPostRef.update({
        'saves': FieldValue.arrayRemove([currentUser.email])
      });
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser.uid)
          .collection('SavedPosts')
          .doc(widget.postid)
          .delete().then((value){
           // print('Removed from saved posts');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        save();
      },
      child: Icon(
        isSaved ? Icons.bookmark : Icons.bookmark_border,
        color: isSaved ? Colors.black : Colors.grey,
        size: 23.sp,
      ),
    );
  }
}
