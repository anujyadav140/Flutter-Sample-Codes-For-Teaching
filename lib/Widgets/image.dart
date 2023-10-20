import 'package:flutter/material.dart';

class FlutterImage extends StatelessWidget {
  const FlutterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     "Flutter Image",
        //     style: TextStyle(fontSize: 50),
        //   ),
        //   backgroundColor: Colors.blue,
        // ),
        body:
            //offline image asset bundle
            // Image.asset(
            //   'images/cat.jpeg',
            //   width: 300,
            //   height: 300,
            //   fit: BoxFit.contain,
            // ),
            const Image(
          image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        ));
  }
}
