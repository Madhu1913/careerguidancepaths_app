import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final txt=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help',style: GoogleFonts.varela()),backgroundColor: Theme.of(context).colorScheme.primary,),
      body: Center(
        child: GestureDetector(
            onTap: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: const Text('Please Raise a Question..'),
                  content: TextFormField(
                        controller: txt,
                    decoration: const InputDecoration(),
                  ),
                  actions: [
                    ElevatedButton(onPressed: ()async{
                      await FirebaseFirestore.instance.collection('Query').add({
                        'question':txt.text.trim()
                      }).then((value) {

                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Your answer will be Updated Shortly')));
                      });
                      Navigator.pop(context);
                    }, child: const Text('Send')),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text('Cancel'))
                  ],
                );
              });
            },
            child: Text('Please ask a question',style: GoogleFonts.varela(fontSize: 24.sp),)),
      ),
    );
  }
}
