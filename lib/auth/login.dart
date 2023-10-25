import 'package:careerguidancepaths_app/auth/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Center(
                    child: Text(
                  'Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _user,
                  validator: (val) => val!.isEmpty ? 'Enter Email' : null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: const Icon(Icons.mail),
                      labelText: 'Email',
                      hintText: 'Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pass,
                  validator: (val) => val!.isEmpty ? 'Enter Password' : null,
                  obscureText: isSeen,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
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
                const SizedBox(
                  height: 10,
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
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Forgot Password? ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: Login
                    //     (){
                    //   Login();
                    //   _user.clear();
                    //   _pass.clear();
                    // }
                    ,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).cardColor),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a Registered user?'),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register',
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
