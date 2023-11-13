import 'package:flutter/material.dart';
class judge extends StatefulWidget {
  const judge({super.key});

  @override
  State<judge> createState() => _judgeState();
}

class _judgeState extends State<judge> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 008, child: Scaffold(appBar: AppBar(title: const Text('Judge'),),));
  }
}
