import 'package:careerguidancepaths_app/auth/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _user = TextEditingController();
  final _pass = TextEditingController();
  bool isSeen = true;
  IconData? icn = Icons.visibility;
  void Login() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
          //Lottie.network('https://lottie.host/2922f269-6c32-4e15-aded-468146deeae9/uUGWXLGjAU.json'),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _user.text, password: _pass.text);
      if (context.mounted) {
        Navigator.pop(context);
      }
      _user.clear();
      _pass.clear();
    } on FirebaseAuthException catch (er) {
      Navigator.pop(context);
      errorMessage(er.code);
    }
  }

  void errorMessage(String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            title: Center(
                child: Text(
              msg,
              style:  GoogleFonts.varela(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Colors.white),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding:  EdgeInsets.all(5.sp),
            child: Column(
              children: [
              SizedBox(
                  height: 195.sp,
                ),
                Center(
                    child: Text(
                  'Login',
                  style: GoogleFonts.varela(fontSize: 35.sp, fontWeight: FontWeight.bold),
                )),
                 SizedBox(
                  height: 25.sp,
                ),
                TextFormField(
                  controller: _user,
                  validator: (val) => val!.isEmpty ? 'Enter Email' : null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp)),
                      prefixIcon: const Icon(Icons.mail),
                      labelText: 'Email',
                      hintText: 'Email'),
                ),
                 SizedBox(
                  height: 15.sp,
                ),
                TextFormField(
                  controller: _pass,
                  validator: (val) => val!.isEmpty ? 'Enter Password' : null,
                  obscureText: isSeen,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp)),
                      labelText: "Password",
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: InkWell(
                          onTap: () {
                            isSeen = !isSeen;
                            setState(() {
                              if (isSeen == true) {
                                icn = Icons.visibility;
                              } else {
                                icn = Icons.visibility_off;
                              }
                            });
                          },
                          child: Icon(icn))),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPasswordPage()));
                      },
                      child:  Padding(
                        padding: EdgeInsets.only(bottom: 4.sp),
                        child: Text(
                          'Forgot Password? ',
                          style: GoogleFonts.varela(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              fontSize: 11.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 5.sp,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red),
                    onPressed: Login,
                    child: Text(
                      'Login',
                      style: GoogleFonts.varela(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a Registered user?'),
                     SizedBox(
                      width: 5.sp,
                    ),
                    InkWell(
                        onTap: widget.onTap,
                        child:  Text(
                          'Register',
                          style: GoogleFonts.varela(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
