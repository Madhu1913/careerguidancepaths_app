import 'package:careerguidancepaths_app/app/account/Provider/careerPointsDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<cpdProvider>(
      builder:(BuildContext context,value,Widget? child)=> Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.all(1.sp),
                  child: SizedBox(
                    height: (6.9).h,
                    width: 20.w,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: value.i,
                      decoration: InputDecoration(
                          labelText: 'Count',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.sp))),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(5.sp),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.sp))
                      ),
                      onPressed: () {
                        value.createFields();
                      },
                      child:  Icon(
                        Icons.add_box,
                        size: 23.sp,
                      )),
                )
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.sp,vertical: 2.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: (6.9).h,
                    width: 75.w,
                    child: TextFormField(
                      onFieldSubmitted: (val){
                        value.pathPointadd(val);
                      },
                      controller: value.pathPoint,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Path',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.sp))),
                    onPressed: () {
                      value.pathPointadd(value.pathPoint.text.trim());
                    },
                    child: Padding(
                      padding:EdgeInsets.symmetric(vertical: 6.sp),
                      child:  Icon(
                        Icons.send,
                        size: 23.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: value.li.length,
                    //  itemCount: 5,
                    itemBuilder: (context, idx) {
                      return Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(4.sp),
                            child: Container(
                              height: (6.9).h,
                              width: 75.w,
                              color: Colors.amberAccent,
                              child: Center(
                                  child: SingleChildScrollView(scrollDirection:Axis.horizontal,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          value.li[idx],
                                          style:  TextStyle(
                                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(onPressed: (){
                                          value.editField(context,idx);
                                        }, icon: const Icon(Icons.edit)),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                           idx!=value.li.length-1?Column(mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Icon(
                                Icons.arrow_downward_outlined,
                                size: 25.sp,
                              ),
                            ],
                          ):Container()
                        ],
                      );
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
          onPressed: () {
          value.fab();
          },
        ),
      ),
    );
  }
}
