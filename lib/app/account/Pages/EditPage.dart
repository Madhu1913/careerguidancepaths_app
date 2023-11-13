import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  final name=TextEditingController();
  final age=TextEditingController();
  final job=TextEditingController();
  final key=GlobalKey<FormState>();
  final currentUser=FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EDIT DETAILS'),centerTitle: true,),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25.h,),
              Padding(
                padding:  EdgeInsets.all(5.sp),
                child: TextFormField(
                  controller: name,
                  validator: (val)=>val!.isEmpty?'Enter the name':null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name'
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.all(5.sp),
                child: TextFormField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  validator: (val)=>val!.isEmpty?'Enter the Age':null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age'
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: TextFormField(
                  controller: job,
                  validator: (val)=>val!.isEmpty?'Enter the job':null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Job'
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              ElevatedButton(onPressed: (){
                if(key.currentState!.validate()){
                  FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).update({
                    'userName':name.text.trim(),
                    'occupation':job.text.trim(),
                    'age':age.text.trim(),
                  });
                  name.clear();
                  job.clear();
                  age.clear();
                  Navigator.pop(context);
                }
              }, child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
