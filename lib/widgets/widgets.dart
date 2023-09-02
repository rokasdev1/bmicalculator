import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget field(
  TextEditingController textcontroller,
) {
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

Widget basicText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}
