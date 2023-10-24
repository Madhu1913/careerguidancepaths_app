import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _user=TextEditingController();
  Future PasswordReset()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _user.text.trim());
      _user.clear();
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Password reset link sent!Check your Email',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
        );
      },
      );
    }on FirebaseAuthException catch (e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter your Email for a Password Reset Link',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _user,
              validator: (val) => val!.isEmpty ? 'Enter Email' : null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.mail),
                  labelText: 'Email',
                  hintText: 'Email'),
            ),
          ),
          ElevatedButton(onPressed:PasswordReset, child: Text('Reset Password'),)
        ],
      ),
    );
  }
}
