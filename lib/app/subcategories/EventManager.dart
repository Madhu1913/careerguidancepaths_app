import 'package:flutter/material.dart';
class eventManager extends StatefulWidget {
  const eventManager({super.key});

  @override
  State<eventManager> createState() => _eventManagerState();
}

class _eventManagerState extends State<eventManager> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 020, child: Scaffold(appBar: AppBar(title: Text('Event Manager'),),));
  }
}
