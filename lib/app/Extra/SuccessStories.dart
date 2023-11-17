import 'package:careerguidancepaths_app/app/Extra/Theme/SuccessStoriesOpen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  List imgs=['https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Sylvester_Stallone_Cannes_2019.jpg/330px-Sylvester_Stallone_Cannes_2019.jpg',
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTt8HZeoaro660SmVo3nBxD8EhGpsAueaKq1MB__HqDM2CJOhWf',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Arnold_Schwarzenegger_1974.jpg/220px-Arnold_Schwarzenegger_1974.jpg',
    'https://www.jkrowling.com/wp-content/uploads/2022/05/J.K.-Rowling-2021-Photography-Debra-Hurford-Brown-scaled.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/MKr25425_Steven_Spielberg_%28Berlinale_2023%29.jpg/330px-MKr25425_Steven_Spielberg_%28Berlinale_2023%29.jpg',
 ];
  List qoutes=['“It’s all about dreams.  Dreams cost nothing, they are free.”  \n-  Sylvester Stallone',
    '“When you undervalue what you do, the world will undervalue who you are.”  \n-  Oprah Winfrey',
    '“You Must See It. You Must Believe It. And Then You Must Never Stop Working To Make It Happen.”\n-  Arnold Schwarzenegger',
    '“You control your own life. Your own will is extremely powerful”  \n-  JK Rowling',
    '“All good ideas start out as a bad ideas, thats why it takes so long ”  \n-  Steven Spielberg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Success Stories'),),
      body: ListView.builder(
          itemCount: imgs.length,
          itemBuilder: (context,i){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessStories(i: i)));
          },
          child: SizedBox(height: 20.h,width: 90.w,child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),side: BorderSide(color: Theme.of(context).colorScheme.primaryContainer,width: 3)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 17.h,width: 40.w,child: Card(
                  child:ClipRRect(
                    child: FadeInImage.assetNetwork(placeholder: 'assets/giphy.gif', image: imgs[i],fit: BoxFit.fill,),
                  ),
                ),),
                SizedBox(height: 19.h,width: 45.w,
                  child: Card(
                    child: Padding(
                      padding:  EdgeInsets.all(8.sp),
                      child: Text(qoutes[i],style: GoogleFonts.varela(),),
                    ),
                  ),
                )
              ],
            ),
          ),),
        );
      }),
    );
    }
}
