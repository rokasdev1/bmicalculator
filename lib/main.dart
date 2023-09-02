import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home.dart';

void main() {
  runApp(const MaterialApp(
    home: ProviderScope(child: homePage()),
  ));
}
