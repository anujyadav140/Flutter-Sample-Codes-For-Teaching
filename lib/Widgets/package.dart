import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class FlutterPackages extends StatefulWidget {
  const FlutterPackages({super.key});

  @override
  State<FlutterPackages> createState() => _FlutterPackagesState();
}

class _FlutterPackagesState extends State<FlutterPackages> {
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<SlideActionState> _key = GlobalKey();
    //    return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: SlideAction(
    //     key: _key,
    //     onSubmit: () {},
    //     alignment: Alignment.centerRight,
    //     child: Text(
    //       'Unlock',
    //       style: TextStyle(
    //         color: Colors.black,
    //       ),
    //     ),
    //     sliderButtonIcon: Icon(Icons.lock),
    //   ),
    // );
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                // Colors.blue,
                // Colors.pink,
                // Colors.orange,
                // Colors.purple
              ], // manually specify the colors to be used
              // createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                _controllerCenter.play();
              },
              child: _display("HELLO!!"),
            ),
          ),
        ],
      ),
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }
}
