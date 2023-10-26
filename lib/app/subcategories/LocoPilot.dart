import 'package:flutter/material.dart';
class locoPilot extends StatefulWidget {
  const locoPilot({super.key});

  @override
  State<locoPilot> createState() => _locoPilotState();
}

class _locoPilotState extends State<locoPilot> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 010, child: Scaffold(appBar: AppBar(title: Text('Loco Pilot'),),));
  }
}
