import 'dart:io';
import 'package:careerguidancepaths_app/app/account/Pages/SavedPostsPage.dart';
import 'package:careerguidancepaths_app/app/account/Pages/TogglePage.dart';
import 'package:careerguidancepaths_app/app/account/Provider/MyPathsProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    super.key,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  File? _selectedImage;
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                           EdgeInsets.only(top: 5.sp, left: 6, bottom: 25.sp),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _openImagePicker();
                              },
                              child: CircleAvatar(
                                  radius: 100,
                                  child: ClipOval(
                                      child: AspectRatio(
                                    aspectRatio: 1,
                                    child: _selectedImage != null
                                        ? Image.file(
                                            _selectedImage!,
                                            fit: BoxFit.cover,
                                          )
                                        :
                                    Image.network(
                                            'https://th.bing.com/th?id=OIP.SxuyKL-Ca-_bXp1TC4c4-gHaF3&w=280&h=222&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
                                            fit: BoxFit.cover,
                                          ),
                                  )))),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Name : ${userdata['userName']}',
                                      style:  GoogleFonts.varela(
                                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                  height: 5.sp,
                                ),
                                Text(
                                  'Age : ${userdata['age']}',
                                  style:  GoogleFonts.varela(
                                      fontSize: 15.sp, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Job : ${userdata['occupation']}',
                          style: GoogleFonts.varela(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                         GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>const savedPostsPage()));
                           },
                           child: Card(
                             child: Padding(
                               padding: EdgeInsets.all(3.sp),
                               child: Text(
                                'Saved',
                                style: GoogleFonts.varela(
                                    fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                     builder:(BuildContext context,value,Widget? child)=> Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              value.toggle1();
                              print(value.togglenum);
                            },
                            child: Card(
                              child:Text(
                                'Add Path',
                                style: GoogleFonts.varela(
                                    fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              value.toggle2();
                              print(value.togglenum);

                            },
                            child: Card(
                              child:  Text(
                                'My Paths',
                                style: GoogleFonts.varela(
                                    fontSize: 20.sp, fontWeight: FontWeight.bold),
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

  // Widget profilePic() {
  //   return GestureDetector(
  //       onTap: () {
  //         _openImagePicker();
  //       },
  //       child: CircleAvatar(
  //           radius: 100,
  //           child: ClipOval(
  //               child: AspectRatio(
  //             aspectRatio: 1,
  //             child: _selectedImage != null
  //                 ? Image.file(
  //                     _selectedImage!,
  //                     fit: BoxFit.cover,
  //                   )
  //                 : Image.network(
  //               'https://th.bing.com/th?id=OIP.SxuyKL-Ca-_bXp1TC4c4-gHaF3&w=280&h=222&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
  //                     fit: BoxFit.cover,
  //                   ),
  //           ))));
  // }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
      // await FirebaseFirestore.instance.collection('Users').doc(currentuser.email).update({
      //   'profilepic':_selectedImage!
      // });
    }
  }
}
