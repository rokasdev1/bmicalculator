import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: ProviderScope(child: homePage()),
  ));
}
