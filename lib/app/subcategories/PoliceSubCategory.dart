import 'package:careerguidancepaths_app/app/StaticPaths/PoliceStaticPaths.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class policeSubCategories extends StatefulWidget {
  final List polSub;
  const policeSubCategories({super.key,required this.polSub});

  @override
  State<policeSubCategories> createState() => _policeSubCategoriesState();
}

class _policeSubCategoriesState extends State<policeSubCategories> with SingleTickerProviderStateMixin{

  AnimationController? controller;
  Animation? gridAnimation;
  Animation? fabAnimation;
  Animation? rotationAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // readJson();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1350));
    gridAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.40, 0.75, curve: Curves.easeOut)));
    fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));
    rotationAnimation = Tween(begin: 0.0, end: 6.2755).animate(controller!);
    rotationAnimation = Tween(begin: 0.0, end: 6.2755).animate(CurvedAnimation(
        parent: controller!, curve: const Interval(0.2, 1, curve: Curves.easeOut)));

    controller?.forward();
    controller?.addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 003,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title:  Text(
            'Police',
            style: GoogleFonts.varela(
                fontWeight: FontWeight.bold, fontSize: 19.sp, color: Colors.white),
          ),
        ),
        body: Transform.scale(
          //opacity: gridAnimation?.value,
          scale: fabAnimation?.value,
          //angle: rotationAnimation?.value,// <-- use this one when grid view is wrapped with Transform.rotate
          //Wrap the Gridview builder with opacity widget and give opacity as gridAnimation.vale for another type of animation
          child: GridView.builder(
              itemCount: widget.polSub.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                mainAxisSpacing: 10,
                //crossAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>policeStaticPaths(i: i)));
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.sp,vertical: 3.sp),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.sp),
                      child: Container(
                        // height: 40.h,
                        // width: 45.w,
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 22.h,
                                child: Card(
                                  child: FadeInImage.assetNetwork(placeholder: 'assets/giphy.gif', image: widget.polSub[i]["url"],
                                    fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(
                                height: 11.5.h,
                                width: 45.w,
                                child: Card(
                                  child: Center(
                                    child: Text(
                                      widget.polSub[i]["name"],
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
