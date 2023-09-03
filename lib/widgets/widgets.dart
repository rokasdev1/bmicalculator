import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Field extends StatelessWidget {
  final TextEditingController textcontroller;
  const Field({super.key, required this.textcontroller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextField(
          controller: textcontroller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ]),
    );
  }
}

class BasicText extends StatelessWidget {
  final text;
  const BasicText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
