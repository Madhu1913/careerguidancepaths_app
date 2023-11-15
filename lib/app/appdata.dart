import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/Categories.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/DynamicPaths.dart';
import 'package:careerguidancepaths_app/app/bottom_nav_bar_classes/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'account/accountPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Appdata extends StatefulWidget {
  const Appdata({
    super.key,
  });

  @override
  State<Appdata> createState() => _AppdataState();
}

class _AppdataState extends State<Appdata> {
  final currentUser = FirebaseAuth.instance.currentUser!;
    bool img=false;
  void  change() async {
    final data = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser.uid)
        .collection('Profile')
        .doc(currentUser.email)
        .get();
    if(data.exists){
      img=true;
    }else{
      img=false;
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    change();

  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        height: 6.h,
          onTap: (idx) {
            setState(() {
              index = idx;
            });
            },
        style:TabStyle.textIn,
        backgroundColor: Colors.red,
          initialActiveIndex: 0,
          items: [
            TabItem(icon: Icons.home_filled,title: 'Home'),
            TabItem(icon: Icons.category_outlined,title: 'Categories'),
            TabItem(icon: Icons.border_clear_outlined,title: 'Paths'),
            TabItem(icon: Icons.person,title: 'Profile'),
          ],
          // animationCurve: Curves.fastOutSlowIn,
          // animationDuration: const Duration(milliseconds: 400),
          // backgroundColor: Colors.white,
          // color: Colors.red,
          // buttonBackgroundColor: Colors.teal,
          // items: const [
          //   CurvedNavigationBarItem(
          //     child: Icon(
          //       Icons.home,
          //       color: Colors.white,
          //     ),
          //   ),
          //   CurvedNavigationBarItem(
          //       child: Icon(
          //     Icons.category,
          //     color: Colors.white,
          //   )),
          //   CurvedNavigationBarItem(
          //       child: Icon(
          //     Icons.book_online_rounded,
          //     color: Colors.white,
          //   )),
          //   CurvedNavigationBarItem(
          //       child: Icon(
          //     Icons.person,
          //     color: Colors.white,
          //   )),
          ),
      body: IndexedStack(
        index: index,
        children: [
          const HomePage(),
          const categories(),
          const dynamicPaths(),
          AccountPage(
            img: img,
          ),
        ],
      ),
    );
  }
}
