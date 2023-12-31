import 'package:careerguidancepaths_app/app/Extra/Help.dart';
import 'package:careerguidancepaths_app/app/Extra/TermsAndConditions.dart';
import 'package:careerguidancepaths_app/app/account/Provider/sharedPreferenceProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

final currentUser=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Consumer<sharedprefs>(
      builder: (BuildContext context,value,Widget? child)=>Drawer(
        // backgroundColor: Colors.red[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.sp),
            side:  BorderSide(color: Theme.of(context).colorScheme.primaryContainer)),
        child: Column(
          children: [
            DrawerHeader(
                child: Container(
              decoration:
                   BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary),
              child: Center(
                  child: Text(
                'Career\nCatalyst',
                style: GoogleFonts.varela(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800),
              )),
            )),

            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: ListTile(
                onTap: (){
                  if(value.isDark==false){
                    value.changeMode();
                    value.getMode();
                  }else{
                    value.revertMode();
                    value.getMode();
                  }
                  Navigator.pop(context);
                },
                tileColor: Theme.of(context).colorScheme.secondary,
                leading: Icon(Icons.change_circle,size: 25.sp,color: Colors.white,),
                title:Text('Switch Mode',style: GoogleFonts.varela(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Colors.white),),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.secondary,
                    onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Help()));
                    },
                title: Text('Help',style: GoogleFonts.varela(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Colors.white),),),
            ),
            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.secondary,
                onTap: (){
                  Future _writeEmail(BuildContext context,String emailAddress) async {
                    final Uri url=Uri(
                      scheme: 'mailto',
                      path: emailAddress,
                    );
                    if (await url_launcher.canLaunchUrl(url)) {
                      await url_launcher.launchUrl(url);
                    } else {
                      const snackBar = SnackBar(content: Text('Cannot write an email'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                  _writeEmail(context, currentUser.email!);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Support()));
                },

                title: Text('Support',style: GoogleFonts.varela(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Colors.white),),),
            ),
            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.secondary,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Terms()));
                  // Navigator.pop(context);
                },
                title: Text('Terms and conditions',style: GoogleFonts.varela(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Colors.white),),),
            ),
            SizedBox(height: 21.h,),
            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: Consumer<sharedprefs>(
                builder:(context,value10,child)=> ListTile(
                  style: ListTileStyle.drawer,
                  tileColor: Theme.of(context).colorScheme.secondary,
                  onTap: (){
                    signOut();
                  },
                  leading: Icon(
                    Icons.logout,
                    size: 25.sp,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Log Out',
                    style: GoogleFonts.varela(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
