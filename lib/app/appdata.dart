import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/Categories.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/Drawer.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/homepage.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'account/accountPage.dart';
import 'bottom_nav_bar_classes/PostedPathsPage.dart';

class Appdata extends StatefulWidget {
  const Appdata({
    super.key,
  });

  @override
  State<Appdata> createState() => _AppdataState();
}

class _AppdataState extends State<Appdata> {
  List classes = [
    const HomePage(),
    const categories(),
    postedPathsPage(),
    const AccountPage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (idx) {
            setState(() {
              index = idx;
            });
          },
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: Colors.white,
          color: Colors.red,
          buttonBackgroundColor: Colors.teal,
          items: const [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            CurvedNavigationBarItem(
                child: Icon(
              Icons.category,
              color: Colors.white,
            )),
            CurvedNavigationBarItem(
                child: Icon(
                  Icons.book_online_rounded,
                  color: Colors.white,
                )),
            CurvedNavigationBarItem(
                child: Icon(
              Icons.person,
              color: Colors.white,
            )),
          ]),
      body: classes[index],
    );
  }
}
