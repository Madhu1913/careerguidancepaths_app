import 'dart:io';
import 'package:careerguidancepaths_app/app/account/Pages/Step%204.dart';
import 'package:careerguidancepaths_app/app/account/Pages/Step1.dart';
import 'package:careerguidancepaths_app/app/account/Provider/careerPointsDataProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../Pages/Step 2.dart';
import '../Pages/Step 3.dart';

class cpiProvider extends ChangeNotifier {
   var uuid=const Uuid();
  late  var v4=uuid.v4();
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
     'https://img.freepik.com/free-vector/doctors-concept-illustration_114360-1515.jpg',
     'https://img.freepik.com/free-vector/building-safety-concept-illustration_114360-7300.jpg',
     'https://img.freepik.com/free-vector/police-officers-concept-illustration_114360-13667.jpg',
     'https://img.freepik.com/free-vector/teacher-concept-illustration_114360-1638.jpg',
     'https://img.freepik.com/free-vector/hand-coding-concept-illustration_114360-8113.jpg?size=626&ext=jpg&uid=R125384538&ga=GA1.1.179435846.1697645450',
     'https://img.freepik.com/free-vector/air-support-concept-illustration_114360-518.jpg',
     'https://img.freepik.com/free-vector/astronaut-suit-illustration_114360-8538.jpg',
     'https://img.freepik.com/free-vector/female-lawyer-concept-illustration_114360-16427.jpg'
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
      'https://img.freepik.com/free-vector/lying-arrow-concept-illustration_114360-8531.jpg';
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
                  const snackBar = SnackBar(behavior: SnackBarBehavior.floating,
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
                        .doc(value1.v4.toString())
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
                      'Likes': [],
                      'saves':[]

                    }).then((value) {
                      value1.v4=value1.uuid.v4();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(behavior: SnackBarBehavior.floating,
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
                        .doc(value1.v4.toString())
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
                      'Likes': [],
                      'saves':[]
                    }).then((value) {
                      value1.v4=value1.uuid.v4();
                    });
                  } catch (err) {
                    throw Exception(err);
                  }
                  value2.li.clear();
                  value2.sour.clear();
                  value2.desc = '';
                  value2.careerName = '';
                  value1.selimg = null;
                  value1.image = null;
                  Navigator.pop(context);
                  value1.z=0;
                  value1.x=0;
                  value2.defDesc=false;
                  value1.fun();

                } else {
                  const snackBar = SnackBar(behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      content: Text('Please Fill Out The Respective Fields'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

              },
              child: const Text('Post')),
        ],
      ),
    );
  }
}
