import 'package:flutter/material.dart';
class astrounaut extends StatefulWidget {
  const astrounaut({super.key});

  @override
  State<astrounaut> createState() => _astrounautState();
}

class _astrounautState extends State<astrounaut> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 017, child: Scaffold(appBar: AppBar(title: const Text('Astrounaut'),),));
  }
}
