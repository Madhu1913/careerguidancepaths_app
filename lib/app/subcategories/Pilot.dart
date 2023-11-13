import 'package:flutter/material.dart';
class pilot extends StatefulWidget {
  const pilot({super.key});

  @override
  State<pilot> createState() => _pilotState();
}

class _pilotState extends State<pilot> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 009, child: Scaffold(appBar: AppBar(title: const Text('Pilot'),),));
  }
}
