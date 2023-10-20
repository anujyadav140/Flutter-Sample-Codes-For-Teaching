import 'package:flutter/material.dart';
import 'package:flutter_teaching/Widgets/gestures.dart';
import 'package:flutter_teaching/Widgets/icons.dart';
import 'package:flutter_teaching/Widgets/image.dart';

class FlutterPageView extends StatelessWidget {
  const FlutterPageView({super.key, required this.abc});
  final String abc;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Flutter Page View",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return FlutterGesture();
                //   },
                // ));
                // Navigator.pushReplacement(context, MaterialPageRoute(
                //   builder: (context) {
                //     return FlutterGesture();
                //   },
                // ));
              },
              icon: Icon(
                Icons.abc,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      // body: Center(
      //   child: Stack(
      //     children: [
      //       Container(width: 400, height: 400, color: Colors.red),
      //       Container(width: 390, height: 390, color: Colors.blue),
      //       Container(width: 380, height: 380, color: Colors.green),
      //       Image.asset('images/cat.jpeg',
      //           width: 380, height: 400, fit: BoxFit.contain),
      //     ],
      //   ),
      // ),

      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: const <Widget>[
          FlutterImage(),
          FlutterIcons(),
          FlutterGesture(),
          // Center(
          //   child: Text('First Page', style: TextStyle(fontSize: 30)),
          // ),
          // Center(
          //   child: Text('Second Page', style: TextStyle(fontSize: 30)),
          // ),
          // Center(
          //   child: Text('Third Page', style: TextStyle(fontSize: 30)),
          // ),
        ],
      ),
    );
  }
}
