import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: homePage()));
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}
