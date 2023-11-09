import 'package:flutter/material.dart';
import 'package:flutter_teaching/Widgets/animation.dart';
import 'package:flutter_teaching/Widgets/auth.dart';
import 'package:flutter_teaching/Widgets/buttons.dart';
import 'package:flutter_teaching/Widgets/chatgpt.dart';
import 'package:flutter_teaching/Widgets/children.dart';
import 'package:flutter_teaching/Widgets/firestore.dart';
import 'package:flutter_teaching/Widgets/gestures.dart';
import 'package:flutter_teaching/Widgets/icons.dart';
import 'package:flutter_teaching/Widgets/image.dart';
// import 'dart:developer';
// import 'package:flutter/rendering.dart';
import 'package:flutter_teaching/Widgets/layout.dart';
import 'package:flutter_teaching/Widgets/package.dart';
import 'package:flutter_teaching/Widgets/pageview.dart';
import 'package:flutter_teaching/Widgets/text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_teaching/firebase_options.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const FlutterGesture(),
      // home: const FlutterImage(),
      // home: const FlutterIcons(),
      // home: const FlutterButtons(),
      // home: const FlutterTexts(),
      // home: const FlutterLayout(),
      // home: FlutterRowColumn(),
      // home: FlutterPageView(abc: 'Anuj',),
      // home: FlutterAnimation(),
      // home: FlutterPackages(),
      // home: const AuthApp(),
      // home: const FirestoreTextfield(),
      home: const FlutterAi(),
    );
  }
}
