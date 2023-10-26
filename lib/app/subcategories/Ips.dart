import 'package:flutter/material.dart';
class ips extends StatefulWidget {
  const ips({super.key});

  @override
  State<ips> createState() => _ipsState();
}

class _ipsState extends State<ips> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: 014, child: Scaffold(appBar: AppBar(title: Text('IPS'),),));
  }
}
