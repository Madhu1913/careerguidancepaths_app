import 'package:careerguidancepaths_app/app/Categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'account/accountPage.dart';

class Appdata extends StatefulWidget {
  const Appdata({
    super.key,
  });

  @override
  State<Appdata> createState() => _AppdataState();
}

class _AppdataState extends State<Appdata> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: signOut,
              icon: Icon(
                Icons.logout,
                size: 30,
                color: Colors.black,
              )),
          Padding(
              padding: EdgeInsets.only(right: 6.sp, top: 4.sp),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountPage(
                            name: '',
                            age: '',
                            occupationOfPerson: '',
                          )));
                },
                splashColor: Theme.of(context).primaryColorDark,
                icon: Icon(
                  Icons.person,
                  size: 23.sp,
                ),
                tooltip: 'Profile',
              ),
            ),
          ],
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => categories()));
        },
        child: Text('Categories'),
      )),
    );
  }
}
