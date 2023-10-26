import 'package:flutter/material.dart';
class airHosters extends StatefulWidget {
  const airHosters({super.key});

  @override
  State<airHosters> createState() => _airHostersState();
}

class _airHostersState extends State<airHosters> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 012, child: Scaffold(appBar: AppBar(title: Text('Air Hosters'),),));
  }
}
