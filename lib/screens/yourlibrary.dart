import 'package:flutter/material.dart';

class YourLibrary extends StatelessWidget {
  const YourLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        "Your Library",
        style: TextStyle(color: Colors.yellow, fontSize: 40),
      ),
    );
  }
}
