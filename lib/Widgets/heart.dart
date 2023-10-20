import 'package:flutter/material.dart';

class BrokenHeartIcon extends StatefulWidget {
  const BrokenHeartIcon(
      {super.key, required this.isHeartBroken, required this.onPressed});
  final bool isHeartBroken;
  final VoidCallback onPressed;
  @override
  State<BrokenHeartIcon> createState() => _BrokenHeartIconState();
}

class _BrokenHeartIconState extends State<BrokenHeartIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(
        widget.isHeartBroken ? Icons.heart_broken : Icons.favorite,
        color: Colors.red,
        size: 30,
      ),
    );
  }
}
