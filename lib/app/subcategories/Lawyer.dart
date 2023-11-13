import 'package:flutter/material.dart';
class lawyer extends StatefulWidget {
  const lawyer({super.key});

  @override
  State<lawyer> createState() => _lawyerState();
}

class _lawyerState extends State<lawyer> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag:007,child: Scaffold(appBar: AppBar(title: const Text('Lawyer'),),));
  }
}
