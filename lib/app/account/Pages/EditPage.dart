import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class editPage extends StatefulWidget {
   String name;
   String age;
   String occupation;


   editPage({super.key, required this.name, required this.age, required this.occupation});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
   TextEditingController name=TextEditingController();
   TextEditingController age=TextEditingController();
   TextEditingController job=TextEditingController();
  final key=GlobalKey<FormState>();
  final currentUser=FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text=widget.name ;
    age.text=widget.age ;
    job.text=widget.occupation ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EDIT DETAILS'),centerTitle: true,),
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
              }, child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
