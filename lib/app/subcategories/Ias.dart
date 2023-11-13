import 'package:flutter/material.dart';
class ias extends StatefulWidget {
  const ias({super.key});

  @override
  State<ias> createState() => _iasState();
}

class _iasState extends State<ias> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 013, child: Scaffold(appBar: AppBar(title: const Text('IAS'),),));
  }
}
