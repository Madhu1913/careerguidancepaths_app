import 'dart:io';
import 'package:careerguidancepaths_app/app/account/Pages/Step%204.dart';
import 'package:careerguidancepaths_app/app/account/Pages/Step1.dart';
import 'package:careerguidancepaths_app/app/account/Provider/careerPointsDataProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../Pages/Step 2.dart';
import '../Pages/Step 3.dart';

class cpiProvider extends ChangeNotifier {
  int _id = 0;
  int get id => _id;
  double _i = 0.0;
  double get i => _i;
  String _txt1 = 'Select an Image';
  String get txt1 => _txt1;
  String _txt2 = 'Step 1';
  String get txt2 => _txt2;
  List classes = [const Step1(), const Step2(), const Step3(), const Step4()];
  int z = 0;
  var rows = [const z0(), const zmid(), const zend()];
  int x = 0;
  void fun() {
    if (z == 0) {
      _i = 0.0;
      _txt2 = 'Step 1';
      x = 0;
      _txt1 = 'Select an Image';
    }
    if (z == 1) {
      _i = 0.25;
      _txt2 = 'Step 2';
      x = 1;
      _txt1 = 'Fill out your career points';
    }
    if (z == 2) {
      _i = 0.75;
      _txt2 = 'Step 3';
      x = 1;
      _txt1 = 'Fill the Extra Details';
    }
    if (z == 3) {
      _i = 1.0;
      _txt2 = 'Step 4';
      x = 2;
      _txt1 = 'Check Everything';
    }
    if (image != null) {
      haveimg = 1;
    }
    if (image == null) {
      haveimg = 0;
    }
    notifyListeners();
  }

  List imgs = [
    'https://img.freepik.com/premium-vector/doctor-character-background-design_730620-7986.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais',
    'https://img.freepik.com/free-vector/man-construction-site-with-icons_1212-660.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais',
    'https://img.freepik.com/premium-vector/illustration-four-policemen-white-background_1308-1206.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais',
    'https://img.freepik.com/free-vector/flat-lawyers-day-background_23-2149216503.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais',
    'https://img.freepik.com/premium-vector/pilot-standing-front-plane_51635-8303.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais'
  ];
  String? selimg;
  void selectImg(val) {
    selimg = val;
    notifyListeners();
  }

  File? image;
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    notifyListeners();
    if (pickedImage != null) {
      image = File(pickedImage.path);
      notifyListeners();
    }
  }

  String defimg =
      'https://img.freepik.com/premium-vector/businessman-with-briefcase-cartoon-concept_24640-7643.jpg?size=626&ext=jpg&uid=R121111794&ga=GA1.1.818006338.1696755883&semt=ais';
  int haveimg = 0;
  int selector = 0;
}

class z0 extends StatelessWidget {
  const z0({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cpiProvider>(
      builder: (BuildContext context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                if ((value.image) != null || (value.selimg) != null) {
                  value.z++;
                  value.fun();
                } else {
                  const snackBar = SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('Please select an image'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Next'))
        ],
      ),
    );
  }
}

class zmid extends StatelessWidget {
  const zmid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cpiProvider>(
      builder: (BuildContext context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                value.z--;
                value.fun();
              },
              child: const Text('Previous')),
          ElevatedButton(
              onPressed: () {
                value.z++;
                value.fun();
              },
              child: const Text('Next')),
        ],
      ),
    );
  }
}

class zend extends StatefulWidget {
  const zend({super.key});

  @override
  State<zend> createState() => _zendState();
}

class _zendState extends State<zend> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Consumer2<cpiProvider, cpdProvider>(
      builder: (BuildContext context, value1, value2, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                value1.z--;
                value1.fun();
              },
              child: const Text('Previous')),
          ElevatedButton(
              onPressed: () {
                if (value2.li.isNotEmpty && value2.desc != 'To be Filled') {
                  try {
                    FirebaseFirestore.instance
                        .collection('Users')
                        .doc(currentuser.uid)
                        .collection("MyPosts")
                        .doc(value1.id.toString())
                        .set({
                      'userEmail': currentuser.email?.split('@')[0],
                      'img': value1.selimg,
                      'careerPoints': value2.li,
                      'TimeStamp': Timestamp.now(),
                      'careerName': value2.careerName,
                      'careerDescription': value2.desc,
                      'careerSources': value2.sour.isNotEmpty
                          ? value2.sour
                          : 'No Sources Available',
                      'Likes': []
                    }).then((value) {
                      value1._id++;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Your Post is Added'),
                        duration: Duration(seconds: 2),
                      ));
                    });
                  } catch (err) {
                    throw Exception(err);
                  }
                  try {
                    FirebaseFirestore.instance
                        .collection('UserPosts')
                        .doc(value1.id.toString())
                        .set({
                      'userEmail': currentuser.email?.split('@')[0],
                      'img': value1.selimg,
                      'careerPoints': value2.li,
                      'TimeStamp': Timestamp.now(),
                      'careerName': value2.careerName,
                      'careerDescription': value2.desc,
                      'careerSources': value2.sour.isNotEmpty
                          ? value2.sour
                          : 'No Sources Available',
                      'Likes': []
                    }).then((value) {
                      value1._id++;
                    });
                  } catch (err) {
                    throw Exception(err);
                  }
                  value2.li.clear();
                  value2.sour.clear();
                  value2.desc = 'To be Filled';
                  value2.careerName = 'To be Filled';
                  value1.selimg = null;
                  value1.image = null;
                  Navigator.pop(context);
                } else {
                  const snackBar = SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('Please Fill Out The Respective Fields'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                // if(value2.li.length>=6){
                //   FirebaseFirestore.instance.collection("UserPosts").add({
                //     'careerPointsSub2':value2.li2,
                //   });
                // }
                // if(value2.li.length>=9){
                //   FirebaseFirestore.instance.collection("UserPosts").add({
                //     'careerPointsSub3':value2.li3,
                //   });
                // }

                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Appdata()));
              },
              child: const Text('Post')),
        ],
      ),
    );
  }
}
