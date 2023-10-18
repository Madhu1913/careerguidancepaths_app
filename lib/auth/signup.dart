import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final phone = TextEditingController();
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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (pass.text == cnfpass.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: mail.text, password: pass.text);
        Navigator.pop(context);
        mail.clear();
        pass.clear();

      }
      else{
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Sign Up',
                      style: GoogleFonts.alkatra(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: name,
                      //validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phone,
                      //validator: (val) => val!.isEmpty ? 'Enter your number' : null,
                      decoration: InputDecoration(
                        labelText: 'mobile number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Age :',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: age,
                            // validator: (val) =>
                            // val!.isEmpty ? 'Enter your age' : null,
                            decoration: InputDecoration(
                              labelText: 'Age',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Gender :',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          // width: 180,
                          child: DropdownButton(
                            onChanged: dropdowncallback,
                            value: _dropdownvalue,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300, fontSize: 30),
                                ),
                                value: 'Male',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300, fontSize: 30),
                                ),
                                value: 'Female',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: mail,
                      validator: (val) => val!.isEmpty ? 'Enter your mail' : null,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    CheckboxMenuButton(
                        value: isEnabled,
                        onChanged: (val) {
                          setState(() {
                            isEnabled = val;
                          });
                        },
                        child: Text(
                          'I agree to Terms & Conditions',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        onPressed:signup,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).cardColor),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: widget.onTap,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
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