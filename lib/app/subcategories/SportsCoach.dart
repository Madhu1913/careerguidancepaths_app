import 'package:flutter/material.dart';
class sportsCoach extends StatefulWidget {
  const sportsCoach({super.key});

  @override
  State<sportsCoach> createState() => _sportsCoachState();
}

class _sportsCoachState extends State<sportsCoach> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 016, child: Scaffold(appBar: AppBar(title: const Text('Sports Coach'),),));
  }
}
