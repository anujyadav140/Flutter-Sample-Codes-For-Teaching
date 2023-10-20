import 'package:flutter/material.dart';

class FlutterButtons extends StatelessWidget {
  const FlutterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Flutter Buttons',
        style: TextStyle(fontSize: 50),
      )),
      body: Center(
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Text Me!!!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue))),
      ),
    );
  }
}
