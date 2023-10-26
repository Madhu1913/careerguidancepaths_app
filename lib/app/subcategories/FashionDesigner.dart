import 'package:flutter/material.dart';
class fashionDesigner extends StatefulWidget {
  const fashionDesigner({super.key});

  @override
  State<fashionDesigner> createState() => _fashionDesignerState();
}

class _fashionDesignerState extends State<fashionDesigner> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 019, child: Scaffold(appBar: AppBar(title: Text('Fashion Designer'),),));
  }
}

