import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final occupation = TextEditingController();
  final mail = TextEditingController();
  final pass = TextEditingController();
  final cnfpass = TextEditingController();
  final age = TextEditingController();
  bool isSeen1 = true;
  bool isSeen2 = true;
  bool? isEnabled = false;
  IconData? icn1 = Icons.visibility;
  IconData? icn2 = Icons.visibility;
  String _dropdownvalue = 'Male';
  void dropdowncallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownvalue = selectedValue;
      });
    }
  }

  void signup() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (pass.text == cnfpass.text) {
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: mail.text, password: pass.text);
        FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.email).set({
          'userName':name.text.trim(),
          'occupation':occupation.text.trim(),
          'age':age.text.trim(),
          //'imag': 'https://th.bing.com/th?id=OIP.SxuyKL-Ca-_bXp1TC4c4-gHaF3&w=280&h=222&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'
        });

        if (context.mounted) {
          Navigator.pop(context);
        }
        mail.clear();
        pass.clear();
      } else {
        errorMessage('Passwords don\'t match');
        Navigator.pop(context);
      }
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
              style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Colors.white),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding:  EdgeInsets.all(5.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 75.sp,
                ),
                Text(
                  'Sign Up',
                  style: GoogleFonts.varela(
                      fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                TextFormField(
                  controller: name,
                  //validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp)),
                  ),
                ),
                 SizedBox(
                  height: 5.sp,
                ),
                TextFormField(
                  //keyboardType: TextInputType.phone,
                  controller: occupation,
                  //validator: (val) => val!.isEmpty ? 'Enter your number' : null,
                  decoration: InputDecoration(
                    labelText: 'Enter occupation',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp)),
                  ),
                ),
                 SizedBox(
                  height: 5.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child:  Text(
                        'Age :',
                        style: GoogleFonts.varela(
                            fontWeight: FontWeight.w500, fontSize: 25.sp),
                      ),
                    ),
                    SizedBox(
                      width: 175.sp,
                      child: TextFormField(
                        controller: age,
                        // validator: (val) =>
                        // val!.isEmpty ? 'Enter your age' : null,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.sp)),
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 5.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Gender :',
                        style: GoogleFonts.varela(
                            fontWeight: FontWeight.w500, fontSize: 25.sp),
                      ),
                    ),
                    SizedBox(
                      // width: 180,
                      child: DropdownButton(
                        onChanged: dropdowncallback,
                        value: _dropdownvalue,
                        items: [
                          DropdownMenuItem(
                            value: 'Male',
                            child: Text(
                              'Male',
                              style: GoogleFonts.varela(
                                  fontWeight: FontWeight.w300, fontSize: 25.sp),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text(
                              'Female',
                              style: GoogleFonts.varela(
                                  fontWeight: FontWeight.w300, fontSize: 25.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
               SizedBox(
                  height: 5.sp,
                ),
                TextFormField(
                  controller: mail,
                  validator: (val) => val!.isEmpty ? 'Enter your mail' : null,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp)),
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                TextFormField(
                  controller: pass,
                  obscureText: isSeen1,
                  validator: (val) =>
                      val!.isEmpty ? 'Enter a Strong Password' : null,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isSeen1 = !isSeen1;
                            if (isSeen1 == true) {
                              icn1 = Icons.visibility;
                            } else {
                              icn1 = Icons.visibility_off;
                            }
                          });
                        },
                        child: Icon(icn1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp)),
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                TextFormField(
                  controller: cnfpass,
                  obscureText: isSeen2,
                  validator: (val) =>
                      val!.isEmpty ? 'Enter password again' : null,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isSeen2 = !isSeen2;
                            if (isSeen2 == true) {
                              icn2 = Icons.visibility;
                            } else {
                              icn2 = Icons.visibility_off;
                            }
                          });
                        },
                        child: Icon(icn2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp)),
                  ),
                ),
                CheckboxMenuButton(
                    value: isEnabled,
                    onChanged: (val) {
                      setState(() {
                        isEnabled = val;
                      });
                    },
                    child:Text(
                      'I agree to Terms & Conditions',
                      style: GoogleFonts.varela(fontWeight: FontWeight.w700),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.red),
                    onPressed: signup,
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.varela(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
               SizedBox(
                  height: 5.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  SizedBox(
                      width: 15.sp,
                    ),
                    InkWell(
                        onTap: widget.onTap,
                        child: Text(
                          'Login',
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
