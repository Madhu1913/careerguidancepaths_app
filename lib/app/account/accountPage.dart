import 'dart:typed_data';
import 'package:careerguidancepaths_app/app/account/Pages/MyWorkSpace.dart';
import 'package:careerguidancepaths_app/app/account/Pages/SavedPostsPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/TogglePage.dart';
import 'package:careerguidancepaths_app/app/account/Provider/MyPathsProvider.dart';
import 'package:careerguidancepaths_app/app/account/Provider/sharedPreferenceProvider.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/PostedPathsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatefulWidget {
   bool img;
   AccountPage({
    super.key,
    required this.img,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  // File? _selectedImage;
  Uint8List? profilePic;
  String? item;

  pickImage() async {
    XFile? imgfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imgfile != null) {
      return imgfile.readAsBytes();
    }
    print('No Image Selected');
  }

  void selectImage() async {
    Uint8List image = await pickImage();
    setState(() {
      profilePic = image;
    });
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentuser.uid)
        .collection('Profile')
        .doc(currentuser.email)
        .set({'img': profilePic?.join('.').toString()}).then(
            (value){

            });

    //    else if (profilePic!=null) {
    //   FirebaseFirestore.instance
    //       .collection('UsersProfile')
    //       .doc(currentuser.uid)
    //       .update({'img': profilePic?.join('.').toString()}).then(
    //           (value) => print('updated in fb'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(currentuser.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userdata = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.sp),
                      child: Row(
                        children: [
                          Text(
                            '@${userdata['userName']}',
                            style: GoogleFonts.varela(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.black),
                          ),
                          Consumer<sharedprefs>(
                            builder: (context, value, child) => IconButton(
                                onPressed: () async {
                                  final data = await FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(currentuser.uid)
                                      .collection('WorkSpace')
                                      .doc(currentuser.email)
                                      .get();
                                  if (data.exists) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const myWorkSpace()));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('WorkSpace is Empty'),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const postedPathsPage())).then(
                                                        (value) {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Text('Add')),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Cancel'))
                                            ],
                                          );
                                        });
                                  }
                                  // if(value.workSpace==true)
                                  // {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => myWorkSpace(
                                  //
                                  //           )));
                                  // }else{
                                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pls add ')));
                                  // }
                                },
                                icon: const Icon(Icons.work)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 5.sp, left: 6, bottom: 25.sp),
                        child: Row(children: [
                          CircleAvatar(
                              radius: 100,
                              child: ClipOval(
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: widget.img
                                          ? StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc(currentuser.uid)
                                                  .collection('Profile')
                                                  .doc(currentuser.email)
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  final data = snapshot.data!;
                                                  final String one =
                                                      data['img'];
                                                  // snapshot.data!.get('img');
                                                  var imgvarlist = one
                                                      .split('.')
                                                      .map((one) =>
                                                          int.parse(one))
                                                      .toList();
                                                  final Uint8List myimg =
                                                      Uint8List.fromList(
                                                          imgvarlist);
                                                  return Image(
                                                    image: MemoryImage(myimg),
                                                    fit: BoxFit.cover,
                                                  );
                                                } else if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(
                                                        '${snapshot.error}'),
                                                  );
                                                }
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              })
                                          : const Image(
                                              image: NetworkImage(
                                                  'https://th.bing.com/th?id=OIP.SxuyKL-Ca-_bXp1TC4c4-gHaF3&w=280&h=222&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                                              fit: BoxFit.cover,
                                            )))),
                          IconButton(
                              onPressed: () async {
                                selectImage();
                               setState(() {
                                 widget.img=true;
                               });
                              },
                              icon: const Icon(Icons.add)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Name : ${userdata['userName']}',
                                      style: GoogleFonts.varela(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                Text(
                                  'Age : ${userdata['age']}',
                                  style: GoogleFonts.varela(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Job : ${userdata['occupation']}',
                          style: GoogleFonts.varela(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const savedPostsPage()));
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(3.sp),
                              child: Text(
                                'Saved',
                                style: GoogleFonts.varela(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Consumer<myPathsProvider>(
                      builder: (BuildContext context, value, Widget? child) =>
                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              value.toggle1();
                              print(value.togglenum);
                            },
                            child: Card(
                              child: Text(
                                'Add Path',
                                style: GoogleFonts.varela(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              value.toggle2();
                              print(value.togglenum);
                            },
                            child: Card(
                              child: Text(
                                'My Paths',
                                style: GoogleFonts.varela(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      children: [
                        togglePages(),
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error ${snapshot.error}'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
