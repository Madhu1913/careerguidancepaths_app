import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class addPathPage extends StatefulWidget {
  const addPathPage({super.key});

  @override
  State<addPathPage> createState() => _addPathPageState();
}

class _addPathPageState extends State<addPathPage> {
  TextEditingController i = TextEditingController();
  final pathPoint = TextEditingController();
  late List li = [];
  List l1 = [];
  int buttonPressed = 0;
  int m = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Add Post'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.all(6.sp),
                child: SizedBox(
                  height: 8.h,
                  width: 20.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: i,
                    decoration: InputDecoration(
                        labelText: 'Count',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.sp))),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(6.sp),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp))
                    ),
                    onPressed: () {
                      setState(() {
                        li = List.generate(int.parse(i.text.trim()),
                                (index) => 'To be Filled');
                      });
                      i.clear();
                    },
                    child:  Icon(
                      Icons.add_box,
                      size: 24.sp,
                    )),
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 8.h,
                  width:75.w,
                  child: TextFormField(
                    controller: pathPoint,
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
                    setState(() {
                      if (pathPoint.text.trim().isNotEmpty) {
                        li[buttonPressed] = pathPoint.text.trim();
                        buttonPressed++;
                      }
                    });
                    pathPoint.clear();
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.sp),
                    child: Icon(
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
                  itemCount: li.length,
                  itemBuilder: (context, idx) {
                    return Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(3.sp),
                          child: Container(
                            height: 8.h,
                            width:96.w,
                            color: Colors.amberAccent,
                            child: Center(
                                child: Text(
                                  li[idx],
                                  style:  TextStyle(
                                      fontSize: 15.sp, fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                       Column(
                          children: [
                            Text(
                              "|",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.sp),
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.sp),
                            ),
                            Icon(
                              Icons.arrow_downward_outlined,
                              size: 25.sp,
                            ),
                          ],
                        )
                      ],
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            li.add('To be Filled');
          });
        },
      ),
    );
  }
}

