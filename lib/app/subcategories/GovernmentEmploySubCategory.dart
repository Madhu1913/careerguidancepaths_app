import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class governmentEmploySubCategories extends StatefulWidget {
  final List govEmpSub;
  const governmentEmploySubCategories({super.key,required this.govEmpSub});

  @override
  State<governmentEmploySubCategories> createState() => _governmentEmploySubCategoriesState();
}

class _governmentEmploySubCategoriesState extends State<governmentEmploySubCategories> with SingleTickerProviderStateMixin {

  AnimationController? controller;
  Animation? gridAnimation;
  Animation? fabAnimation;
  Animation? rotationAnimation;
  //List _docsubcategories=docSub;

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
      tag: 006,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title:  Text(
            'Government Employee',
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
              itemCount: widget.govEmpSub.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                //crossAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.sp),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.sp),
                    child: Container(
                      // height: 40.h,
                      // width: 45.w,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 22.h,
                              child: Card(
                                child: Image.network(
                                  widget.govEmpSub[i]["url"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 11.5.h,
                              width: 45.w,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    widget.govEmpSub[i]["name"],
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
                );
              }),
        ),
      ),
    );
  }
}
