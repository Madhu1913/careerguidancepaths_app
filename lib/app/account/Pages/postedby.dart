import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class PostedBy extends StatefulWidget {
  const PostedBy({super.key});

  @override
  State<PostedBy> createState() => _PostedByState();
}

class _PostedByState extends State<PostedBy> {
  final currentUser=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(stream: FirebaseFirestore.instance.collection('Users').doc(currentUser.email).snapshots(),
    builder: (context,snapshot){
      if(snapshot.hasData){
        final userdata = snapshot.data!.data() as Map<String, dynamic>;
        return Text(
          '@${userdata['userName']}',
          style: GoogleFonts.varela(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.black),
        );
      }else if(snapshot.hasError){
        return Center(
          child: Text('${snapshot.hasError}'),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    },);
  }
}
