import 'package:flutter/material.dart';

class FlutterIcons extends StatefulWidget {
  const FlutterIcons({super.key});

  @override
  State<FlutterIcons> createState() => _FlutterIconsState();
}

class _FlutterIconsState extends State<FlutterIcons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Flutter Icons',
      //     style: TextStyle(fontSize: 50),
      //   ),
      //   backgroundColor: Colors.amber,
      // ),
      body: Container(
        child: Row(
          children: [
            Icon(
              Icons.home,
            ),
            Icon(
              Icons.heart_broken,
            ),
            Icon(
              Icons.camera,
            ),
          ],
        ),
      ),
    );
  }
}
