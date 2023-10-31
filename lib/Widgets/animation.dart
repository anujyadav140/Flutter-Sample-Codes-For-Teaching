import 'dart:math';

import 'package:flutter/material.dart';

class FlutterAnimation extends StatefulWidget {
  const FlutterAnimation({super.key});

  @override
  State<FlutterAnimation> createState() => _FlutterAnimationState();
}

class _FlutterAnimationState extends State<FlutterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animationOpacity;
  final _opacityTween = Tween<double>(begin: -0.1, end: 1);
  bool play = true;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _animationOpacity = _opacityTween.animate(_controller);

    // _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn)
    // ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _controller.forward();
    //   }
    // });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Logo Animation'),
        actions: [
          IconButton(
              onPressed: () {
                play = !play;
                if (play) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              icon: Icon(
                Icons.play_arrow,
                size: 30,
              ))
        ],
      ),
      // body: Center(
      //   child: FadeTransition(
      //     opacity: _animationOpacity,
      //     child: Container(
      //       width: 300,
      //       height: 300,
      //       color: Colors.blue,
      //     ),
      //   ),
      // ),
      // body: Center(
      //   child: AnimatedBuilder(
      //     animation: _controller,
      //     builder: (context, child) {
      //       return Transform.scale(
      //         scale: _animation.value,
      //         child: FlutterLogo(size: 200),
      //       );
      //     },
      //   ),
      // ),
      // body: Center(
      //   child: AnimatedBuilder(
      //     animation: _controller,
      //     builder: (context, child) {
      //       return Transform.translate(
      //         offset: Offset(200.0 * _animation.value, 0.0),
      //         child: FlutterLogo(size: 200),
      //       );
      //     },
      //   ),
      // ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: pi / 4 * _animation.value,
              child: FlutterLogo(size: 200),
            );
          },
        ),
      ),
      // body: Center(
      //   child: AnimatedBuilder(
      //     animation: _controller,
      //     builder: (context, child) {
      //       return Transform.translate(
      //         offset: Offset(200 * _animation.value, 200 * _animation.value),
      //         child: FlutterLogo(size: 200),
      //       );
      //     },
      //   ),
      // ),
      // body: Center(
      //   child: AnimatedBuilder(
      //     animation: _controller,
      //     builder: (context, child) {
      //       return Transform(
      //         transform: Matrix4.identity()
      //           ..setEntry(3, 2, 0.01) // Apply a perspective transform
      //           ..rotateX(0.1 * _animation.value) // Rotates along the X-axis
      //           ..translate(50.0 * _animation.value, 0.0) // Translates to position
      //           ..scale(1.5 * _animation.value), // Scales the logo
      //         alignment: Alignment.center,
      //         child: FlutterLogo(size: 200),
      //       );
      //     },
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
