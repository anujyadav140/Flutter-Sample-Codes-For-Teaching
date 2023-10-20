import 'package:flutter/material.dart';

class FlutterRowColumn extends StatelessWidget {
  const FlutterRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Flutter row and column",
          style: TextStyle(fontSize: 30, color: Colors.amber),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This is a row",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  onPressed: () {
                    print('button pressed');
                  },
                  icon: Icon(
                    Icons.camera,
                    size: 30,
                  )),
              Text(
                'this is a row!!!!',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "This is a row",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  onPressed: () {
                    print('button pressed');
                  },
                  icon: Icon(
                    Icons.camera,
                    size: 30,
                  )),
              Text(
                'this is a row!!!!',
                style: TextStyle(fontSize: 30),
              )
            ],
          )
        ],
      ),
    );
  }
}
