import 'package:bmi/providers.dart';
import 'package:bmi/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 90,
          backgroundColor: Colors.teal[800],
          title: const Text(
            'BMI Calculator',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BasicText(
                  text:
                      'The body mass index (BMI) is a measure that uses your height and weight to work out if your weight is healthy.'),
              const SizedBox(height: 50),
              Row(
                children: [
                  const BasicText(text: 'Height:'),
                  const SizedBox(width: 80),
                  Field(textcontroller: ref.read(heightControllerProvider))
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  const BasicText(text: 'Weight:'),
                  const SizedBox(width: 80),
                  Field(textcontroller: ref.read(weightControllerProvider))
                ],
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                  onPressed: () {
                    CalculationNotifer().calculate(ref);
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
              const SizedBox(height: 50),
              BasicText(text: 'Your BMI is ${ref.watch(resultProvider)}'),
              Text(ref.watch(statusProvider),
                  style: TextStyle(
                      color: ref.watch(statusColorProvider),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text(ref.watch(solutionProvider),
                  style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
