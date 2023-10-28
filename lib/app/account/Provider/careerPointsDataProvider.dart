

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class cpdProvider extends ChangeNotifier{
  final i = TextEditingController();
  final pathPoint = TextEditingController();
   List li = [];
  // List l1 = [];
  late List li1=li.sublist(0,3);
  late List li2=li.sublist(3,6);
  late List li3=li.sublist(6,9);
  late List li4=li.sublist(9,12);

  int buttonPressed = 0;
  int m = 0;
  void createFields(){
    li = List.generate(int.parse(i.text.trim()),
            (index) => 'To be Filled');
    i.clear();
    notifyListeners();
  }
  void pathPointadd(txt){
      if (txt.isNotEmpty) {
    li[buttonPressed] = txt;
        buttonPressed++;
      }
      pathPoint.clear();
      notifyListeners();
  }
  void fab(){
    li.add('To be Filled');
    notifyListeners();
  }
  Future<void> imgShowfil(BuildContext context,img)async{
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(careerName,style: GoogleFonts.varela(fontWeight: FontWeight.bold),),
        content: SizedBox(height: 32.h,width: 70.w,child: Image.file(img,fit: BoxFit.fill,),),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Minimize'))
        ],
      );
    });
    notifyListeners();
  }
  Future<void> imgShownet(BuildContext context,img)async{
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(careerName,style: GoogleFonts.varela(fontWeight: FontWeight.bold),),
        content: SizedBox(height: 32.h,width: 70.w,child: Image.network(img,fit: BoxFit.fill,),),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Minimize'))
        ],
      );
    });
    notifyListeners();
  }
  Future<void> editField(BuildContext context,int i) async{
    final edtxt=TextEditingController();
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Edit'),
        content: TextFormField(
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Edit here'),
          controller: edtxt,
        ),
        actions: [
          TextButton(onPressed: (){
           if(edtxt.text.trim().isNotEmpty){
             li[i]=edtxt.text.trim();
           }
            Navigator.pop(context);
          }, child: const Text('Save')),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('cancel')),
        ],
      );
    });
    notifyListeners();
  }
  String careerName='To be Filled';
  final careernamecont=TextEditingController();
  void headingsent(head){
    if(head.isNotEmpty){
      careerName=head;
    }
    careernamecont.clear();
    notifyListeners();
  }
  String desc='To be Filled';
  final descCont=TextEditingController();
  void description(descr){
    if(descr.isNotEmpty){
      desc=descr;
    }
    descCont.clear();
    notifyListeners();
  }
   void descClear(){
    desc='To be Filled';
    tffreadOnly=false;
    defDesc=false;
    notifyListeners();
   }
   bool defDesc=false;
  bool tffreadOnly=false;
   void defDescFun(){
     if(defDesc==true&& careerName!='To be Filled'){
       tffreadOnly=true;
       desc='I Followed This Career Path To Succeed In My Career as an ${careerName}.\n'
           'I have to say that hard work is the one that leads me to success but as everyone knows luck also plays a role in our journey\n'
           'So motive of mine is if i did my part then everything will be ok....\n'
           'coz i believe only if i gave my best then luck will take a look at me(and it gives me a little confidence too)..';
     }
     notifyListeners();
   }
  List sour=[];
  final sourcesCont=TextEditingController();
  void sources(src){
    if(src.isNotEmpty){
      sour.add(src);
    }
    sourcesCont.clear();
    notifyListeners();
  }
  void sourClear(){
    sour=[];
    notifyListeners();
  }


}