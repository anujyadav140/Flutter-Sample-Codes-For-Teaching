import 'dart:ui';

import 'package:flutter/material.dart';

class FlutterTexts extends StatelessWidget {
  const FlutterTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: const Text(
          "Flutter Image",
          style: TextStyle(fontSize: 50),
        ),
        backgroundColor: Colors.blue,
      ),
      body:
          //SIMPLE TEXT WIDGET
          // Container(
          //   width: 100,
          //   height: 100,
          //   child: Text(
          //     "Hello world ",
          //   ),
          // ),
          //RICH TEXT SPAN WIDGET
          Container(
        width: 300,
        height: 300,
        color: Colors.green,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Hello',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' world',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: 'BYE BYE',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      //     Container(
      //   child: SelectionArea(
      //       child: Column(
      //     children: [
      //       Text(
      //         'this is a selectable area text',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //       SelectionContainer.disabled(
      //           child: Text(
      //         'this cannot be selected!',
      //         style: TextStyle(fontSize: 30),
      //       ))
      //     ],
      //   )),
      // ),
    );
  }
}
