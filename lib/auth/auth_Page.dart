import 'package:careerguidancepaths_app/app/appdata.dart';
import 'package:careerguidancepaths_app/auth/login.dart';
import 'package:careerguidancepaths_app/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const Appdata();
          }
          else{
            return const _LoginOrRegister();
          }
        }
      )

    );
  }
}


class _LoginOrRegister extends StatefulWidget {
  const _LoginOrRegister({super.key});

  @override
  State<_LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<_LoginOrRegister> {
  bool showLoginPage=true;
  void togglePage(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(onTap: togglePage);
    }else{
      return SignUp(
        onTap: togglePage,
      );
    }
  }
}

