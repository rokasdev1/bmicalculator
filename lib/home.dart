import 'package:bmi/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();
String result = '';
String status = "";
Color statusColor = Colors.black;

class _homePageState extends State<homePage> {
  void calculate() {
    int height = int.tryParse(heightController.text) ?? 0;
    int weight = int.tryParse(weightController.text) ?? 0;
    double heightInMeters = height / 100.0;
    double bmi = weight / (heightInMeters * heightInMeters);
    setState(() {
      result = bmi.toStringAsFixed(1);
    });

    if (bmi < 18.5) {
      status = "Underweight";
      statusColor = Colors.amber;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      status = "Healthy";
      statusColor = Colors.green;
    } else if (bmi >= 25 && bmi <= 29.9) {
      status = 'Overweight';
      statusColor = Colors.red;
    } else if (bmi >= 30) {
      status = 'Obese';
      statusColor = Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        backgroundColor: Colors.teal[800],
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            basicText(
                'The body mass index (BMI) is a measure that uses your height and weight to work out if your weight is healthy.'),
            SizedBox(height: 50),
            Row(
              children: [
                basicText('Height:'),
                SizedBox(width: 80),
                field(heightController)
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                basicText('Weight:'),
                SizedBox(width: 80),
                field(weightController)
              ],
            ),
            SizedBox(height: 40),
            OutlinedButton(
                onPressed: calculate,
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            SizedBox(height: 50),
            basicText('Your BMI is ' + result),
            Text(status,
                style: TextStyle(
                    color: statusColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
