import 'package:careerguidancepaths_app/app/account/Provider/careerPointsDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return Consumer<cpdProvider>(
      builder: (BuildContext context, value, Widget? child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.sp),
                    child: const Text('CareerName',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                  ),
                ],
              ),
               Padding(
                padding: EdgeInsets.all(3.0.sp),
                child: const Divider(height: 2,thickness: 2,color: Colors.black,),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.amber,width: 2),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.sp,bottom: 5.sp,left: 10.sp,right:10.sp),
                      child: Text(value.careerName.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.all(5.sp),
                child: TextFormField(
                  onFieldSubmitted: (val){
                    value.headingsent(val);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(11.sp)),
                    hintText: 'Enter your career name here..',
                    suffixIcon: IconButton(onPressed: (){
                      value.headingsent(value.careernamecont.text.trim());
                    },icon: const Icon(Icons.send),)
                  ),
                  controller: value.careernamecont,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.sp),
                    child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19.sp),),
                  ),
                ],
              ),
               Padding(
                padding: EdgeInsets.all(3.0.sp),
                child: const Divider(height: 2,thickness: 2,color: Colors.black,),
              ),
              Column(
                children: [
                 Card(child: Padding(
                   padding:  EdgeInsets.only(left: 5.sp,right:5.sp,),
                   child: Text(value.desc.toString(),style:  TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500),),
                 ),),
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(5.sp),
                        child: SizedBox(
                          width:75.w,
                          child: TextFormField(
                            onFieldSubmitted: (val){
                              value.description(val);
                            },
                            readOnly: value.tffreadOnly,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(11.sp)),
                                hintText: 'Enter your description here..',
                                suffixIcon: IconButton(onPressed: (){
                                  value.description(value.descCont.text.trim());
                                },icon: const Icon(Icons.send),)
                            ),
                            controller: value.descCont,
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){
                        value.descClear();
                      }, icon: const Icon(Icons.delete_outline))
                    ],
                  ),
                  CheckboxMenuButton(value: value.defDesc, onChanged: (val){
                    if(value.careerName!='To be Filled'){
                      value.defDesc=val!;
                      value.defDescFun();
                    }
                  }, child: const Text('Select the default description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))
                ],
              ),
               Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:13.sp),
                    child: Text('Sources',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19.sp),),
                  ),
                ],
              ),
               Padding(
                padding: EdgeInsets.all(13.sp),
                child: const Divider(height: 2,thickness: 2,color: Colors.black,),
              ),
              SizedBox(
                height: 23.h,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.sour.length,
                          itemBuilder: (context,i){
                         return Text(value.sour[i].toString(),style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 20),);
                      }),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(5.sp),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 75.w,
                            child: TextFormField(
                              //readOnly: value.tffreadOnly,
                              onFieldSubmitted: (val){
                                value.sources(val);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(11.sp)),
                                  hintText: 'Enter the Sources here..',
                                  suffixIcon: IconButton(onPressed: (){
                                    value.sources(value.sourcesCont.text.trim());
                                  },icon: const Icon(Icons.send),)
                              ),
                              controller: value.sourcesCont,
                            ),
                          ),
                          IconButton(onPressed: (){value.sourClear();}, icon: const Icon(Icons.delete_outline))
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
