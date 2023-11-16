import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:careerguidancepaths_app/auth/auth_Page.dart';
import 'package:flutter/material.dart';
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
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(15, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.linear,
    ));
    Timer(const Duration(seconds: 1), () => Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthPage())));

  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(child: Text('Career Catalyst'),) ,
    );
  }
}
