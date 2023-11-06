import 'package:careerguidancepaths_app/app/account/Provider/CPIprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<cpiProvider>(
      builder: (BuildContext context, value, Widget? child) =>
          Column(children: [
        // InkWell(
        //   onDoubleTap: (){
        //     value.openImagePicker();
        //     value.selimg=null;
        //   },
        //   onTap: () {
        //     if(value.selimg==null){
        //       value.openImagePicker();
        //     }
        //   },
        //   child: Padding(
        //     padding:  EdgeInsets.all(5.sp),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Text(
        //           'Select an image from gallery',
        //           style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        //         ),
        //         value.image != null
        //             ? const Icon(
        //                 Icons.circle,
        //                 color: Colors.red,
        //               )
        //             : const Icon(
        //                 Icons.circle_outlined,
        //                 color: Colors.red,
        //               )
        //       ],
        //     ),
        //   ),
        // ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: value.imgs.length,
            itemBuilder: (context, i) {
              return ListTile(
                  leading: Radio(
                    value: value.imgs[i],
                    groupValue: value.selimg,
                    onChanged: (val) {
                      value.selectImg(val);
                    },
                  ),
                  title: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(value.imgs[i]))),
                  ));
            },
          ),
        ),
        ListTile(
          onLongPress: (){value.selector=1;},
            leading: Radio(
              value: value.defimg,
              groupValue: value.selimg,
              onChanged: (val) {
                value.selectImg(val);
              },
            ),
            title: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Select the default image',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                Container(height: 80,width: 100,
                    decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(value.defimg,),fit: BoxFit.cover),
                )),
              ],
            ))
      ]),
    );
  }
}
