import 'dart:math';

import 'package:flutter/material.dart';

class FlutterGesture extends StatefulWidget {
  const FlutterGesture({super.key});

  @override
  State<FlutterGesture> createState() => _FlutterGestureState();
}

class _FlutterGestureState extends State<FlutterGesture> {
  double _top = 0.0;
  double _left = 0.0;
  Offset _currentPosition = const Offset(0, 0);
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gesture Detector Widget",
          style: TextStyle(fontSize: 50),
        ),
        backgroundColor: Colors.red,
      ),
      body:
          //this code implements the drag update gesture detector
          //     Stack(
          //   children: [
          //     Positioned(
          //       top: _top,
          //       left: _left,
          //       child: GestureDetector(
          //         onPanUpdate: (details) {
          //           setState(() {
          //             _top = max(0, _top + details.delta.dy);
          //             _left = max(0, _left + details.delta.dx);
          //           });
          //         },
          //         child: Container(
          //           width: 300,
          //           height: 300,
          //           color: Colors.red,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          //THIS CODE IS TO EXPLAIN THE COORDINATES
          // GestureDetector(
      //   onPanUpdate: (details) {
      //     setState(() {
      //       _currentPosition = details.localPosition;
      //     });
      //   },
      //   child: Container(
      //     color: Colors.white,
      //     child: Center(
      //       child: Text(
      //         'Coordinates: ${_currentPosition.toString()}',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //     ),
      //   ),
      // ),
          GestureDetector(
        onTap: () {
          setState(() {
            count = count + 1;
          });
        },
        child: Container(
          width: 300,
          height: 300,
          color: Colors.green,
          child: Text(
            "Click on me $count",
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
