import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Terms and Conditions'),),
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 1.h,),
                  Text("TERMS & CONDITIONS:\n",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text(
                      "•	By accessing or using CAREER CATALYST, you agree to comply with and be bound by these terms and conditions.\n"
                          "•	This app gives you the basic knowledge of the career you selected. We are not responsible for your future.\n"
                          "•	Users may need to create an account to access certain app features. You are responsible for maintaining the confidentiality of your account information.\n"
                          "•	Users agree not to use the app for any unlawful or prohibited activities and to comply with all applicable laws and regulations.\n"
                          "•	Intellectual property laws protect the app and its content. Users agree not to reproduce, distribute, modify, or create derivative works of any content without our explicit consent.\n",style: TextStyle(
                        fontSize: 11.sp
                    ),),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(5.sp),
                    child: Text("•	**By using CAREER CATALYST, you acknowledge that you have read, understood, and agree to be bound by these terms and conditions.",style: TextStyle(fontSize: 14.sp),),
                  ),
                ],
              ),
            ),
            ),
        );
    }
}
