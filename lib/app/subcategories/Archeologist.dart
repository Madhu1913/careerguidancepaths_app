import 'package:flutter/material.dart';
class archeologist extends StatefulWidget {
  const archeologist({super.key});

  @override
  State<archeologist> createState() => _archeologistState();
}

class _archeologistState extends State<archeologist> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 018, child: Scaffold(appBar: AppBar(title: Text('Archeologist'),),));
  }
}
