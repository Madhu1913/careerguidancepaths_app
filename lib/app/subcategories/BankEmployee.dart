import 'package:flutter/material.dart';
class bankEmployee extends StatefulWidget {
  const bankEmployee({super.key});

  @override
  State<bankEmployee> createState() => _bankEmployeeState();
}

class _bankEmployeeState extends State<bankEmployee> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 011, child: Scaffold(appBar: AppBar(title: const Text('Bank Employee'),),));
  }
}
