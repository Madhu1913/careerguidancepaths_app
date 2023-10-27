import 'dart:io';

import 'package:careerguidancepaths_app/app/account/Pages/Step%204.dart';
import 'package:careerguidancepaths_app/app/account/Pages/Step1.dart';
import 'package:careerguidancepaths_app/app/account/Pages/post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../Pages/Step 2.dart';
import '../Pages/Step 3.dart';


class cpiProvider extends ChangeNotifier {
  double _i = 0.0;
  double get i => _i;
  String _txt1 = 'Select an Image';
  String get txt1 => _txt1;
  String _txt2 = 'Step 1';
  String get txt2 => _txt2;
  List classes = [Step1(), Step2(), Step3(), Step4()];
  int z = 0;
  var rows = [z0(), zmid(), zend()];
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
    if(image!=null){
      haveimg=1;
    }
    if(image==null){
      haveimg=0;
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
  int haveimg=0;
  int selector=0;

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
                  final snackBar =
                      SnackBar(content: Text('Please select an image'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Next'))
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
              child: Text('Previous')),
          ElevatedButton(
              onPressed: () {
                value.z++;
                value.fun();
              },
              child: Text('Next')),
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
              child: Text('Previous')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>test()));
              },
              child: Text('Post')),
        ],
      ),
    );
  }
}
