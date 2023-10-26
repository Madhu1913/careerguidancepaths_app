import 'package:careerguidancepaths_app/Extra/Theme/ThemeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context,value,Widget? child)=>Drawer(
        backgroundColor: Colors.red[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.sp),
            side: BorderSide(color: Colors.amber)),
        child: Column(
          children: [
            DrawerHeader(
                child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Center(
                  child: Text(
                'Career\nCatalyst',
                style: GoogleFonts.varela(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800),
              )),
            )),
            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: ListTile(
                style: ListTileStyle.drawer,
                tileColor: Colors.red[600],
                onTap: signOut,
                leading: Icon(
                  Icons.logout,
                  size: 32.sp,
                  color: Colors.white,
                ),
                title: Text(
                  'Log Out',
                  style: GoogleFonts.varela(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20.sp),
                ),
              ),
            ),
            SizedBox(
              height: 16.sp,
            ),
            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: ListTile(
                onTap: (){
                  value.toggleTheme();
                  Navigator.pop(context);
                },
                tileColor: Colors.red[600],
                leading: Icon(Icons.change_circle,size: 28.sp,color: Colors.white,),
                title:Text('Switch Mode',style: GoogleFonts.varela(fontWeight: FontWeight.w500,fontSize: 20.sp,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
