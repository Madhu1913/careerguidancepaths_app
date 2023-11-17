import 'dart:async';

import 'package:careerguidancepaths_app/auth/auth_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
// import 'package:careerguidancepaths_app/auth/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0,1.0),
      end: const Offset(0,0.25),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.linear,
    ));
    _controller!.forward();
    Timer(const Duration(milliseconds: 2000), () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const AuthPage())));

  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SlideTransition(
          position: _offsetAnimation!,
          child: Column(
            children: [
              SizedBox(height:45.h,width:90.w,child: ClipRRect(borderRadius: BorderRadius.circular(24),child: const Image(image: AssetImage('assets/careercatalysticon3.jpg'),fit: BoxFit.fill,))),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Career',style: GoogleFonts.varela(fontSize: 30.sp,color: Theme.of(context).colorScheme.secondary),),
                  Text('Catalyst',style: GoogleFonts.varela(fontSize: 30.sp,color: Theme.of(context).colorScheme.primary),),
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}
