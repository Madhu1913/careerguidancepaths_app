

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class myPathsProvider extends ChangeNotifier{
   bool _togglenum=false;
   bool get togglenum=>_togglenum;
   void toggle1(){
      _togglenum=false;
      notifyListeners();
   }
   void toggle2(){
      _togglenum=true;
      notifyListeners();
   }
   final currentUser=FirebaseAuth.instance.currentUser!;
    void ondel(String? postid)async{
       await FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).collection('MyPosts')
           .doc(postid)
           .delete()
           .then((value) => print('deleted'));
       await FirebaseFirestore.instance
           .collection('UserPosts')
           .doc(postid)
           .delete()
           .then((value) => print('deleted'));
    }

}