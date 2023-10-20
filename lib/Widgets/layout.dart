import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_teaching/Widgets/heart.dart';

class FlutterLayout extends StatefulWidget {
  const FlutterLayout({super.key});

  @override
  State<FlutterLayout> createState() => _FlutterLayoutState();
}

class _FlutterLayoutState extends State<FlutterLayout> {
  bool isHeartBrokenBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IconButton(
            onPressed: () {
              setState(() {
                isHeartBrokenBool = !isHeartBrokenBool;
              });
            },
            icon: Icon(
              Icons.heart_broken,
              size: 50,
              color: isHeartBrokenBool ? Colors.red : Colors.blue,
            )));
  }
}
