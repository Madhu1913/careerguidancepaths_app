import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class doctorSubCategories extends StatefulWidget {
  const doctorSubCategories({super.key});

  @override
  State<doctorSubCategories> createState() => _doctorSubCategoriesState();
}

class _doctorSubCategoriesState extends State<doctorSubCategories>
    with SingleTickerProviderStateMixin {
  List _docsubcategories = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);
    setState(() {
      _docsubcategories = data["subDoc"];
    });
  }

  AnimationController? controller;
  Animation? gridAnimation;
  Animation? fabAnimation;
  Animation? rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1350));
    gridAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.40, 0.75, curve: Curves.easeOut)));
    fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));
    rotationAnimation = Tween(begin: 0.0, end: 6.2755).animate(controller!);
    rotationAnimation = Tween(begin: 0.0, end: 6.2755).animate(CurvedAnimation(
        parent: controller!, curve: Interval(0.2, 1, curve: Curves.easeOut)));

    controller?.forward();
    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 001,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Doctor',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
          ),
        ),
        body: Transform.scale(
          scale: fabAnimation?.value,
          // angle: rotationAnimation?.value, <-- use this one when grid view is wrapped with Transform.rotate
          //Wrap the Gridview builder with opacity widget and give opacity as gridAnimation.vale for another type of animation
          child: GridView.builder(
              itemCount: _docsubcategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                //crossAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
                                  _docsubcategories[i]["url"],
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
                                    _docsubcategories[i]["name"],
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
