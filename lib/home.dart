import 'package:bmi/widgets/widgets.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();
String result = '';
String status = '';
String solution = '';
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
      solution =
          'Your best solution to stop being underweight is to focus on increasing calorie intake with nutrient-dense foods. Incorporate protein-rich sources like lean meats, nuts, and legumes. Engage in strength training exercises to build muscle mass and improve overall health.';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      status = "Healthy";
      statusColor = Colors.green;
      solution =
          'You are healthy! But if you want to continue keeping a healthy weight, you should start a balanced diet comprising fruits, vegetables, whole grains, lean proteins, and healthy fats. Regular exercise, such as 150 minutes of moderate-intensity aerobic activity per week, enhances cardiovascular health and helps manage stress. Strength training contributes to overall fitness.';
    } else if (bmi >= 25 && bmi <= 29.9) {
      status = 'Overweight';
      statusColor = Colors.red;
      solution =
          'There are ways to cut being overweight such as creating a calorie deficit through a balanced diet and regular exercise. Be mindful of portion sizes and reduce the consumption of sugary and processed foods. Incorporate moderate-intensity exercises like brisk walking and cycling to burn excess calories.';
    } else if (bmi >= 30) {
      status = 'Obese';
      statusColor = Colors.redAccent;
      solution =
          'Addressing obesity requires professional guidance and lifestyle changes. Seek advice from healthcare professionals or registered dietitians to develop a personalized weight loss plan. Adopt a balanced diet that promotes sustained weight loss while providing essential nutrients. Regular exercise combining cardio and strength training enhances metabolism and overall fitness.';
    }
  }

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
              basicText(
                  'The body mass index (BMI) is a measure that uses your height and weight to work out if your weight is healthy.'),
              const SizedBox(height: 50),
              Row(
                children: [
                  basicText('Height:'),
                  const SizedBox(width: 80),
                  field(heightController)
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  basicText('Weight:'),
                  const SizedBox(width: 80),
                  field(weightController)
                ],
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                  onPressed: calculate,
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
              const SizedBox(height: 50),
              basicText('Your BMI is ' + result),
              Text(status,
                  style: TextStyle(
                      color: statusColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text(solution, style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
