import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final heightControllerProvider = StateProvider((_) => TextEditingController());
final weightControllerProvider = StateProvider((_) => TextEditingController());
final resultProvider = StateProvider<String>((_) => '');
final statusProvider = StateProvider<String>((_) => '');
final statusColorProvider = StateProvider<Color>((_) => Colors.transparent);
final solutionProvider = StateProvider<String>((_) => '');

void calculate(BuildContext context, WidgetRef ref) {
  final heightController = ref.read(heightControllerProvider);
  final weightController = ref.read(weightControllerProvider);

  int height = int.tryParse(heightController.text) ?? 0;
  int weight = int.tryParse(weightController.text) ?? 0;
  double heightInMeters = height / 100.0;
  double bmi = weight / (heightInMeters * heightInMeters);

  ref.read(resultProvider.state).update((state) => bmi.toStringAsFixed(1));

  if (bmi < 18.5) {
    ref.read(statusProvider.state).update((state) => "Underweight");
    ref.read(statusColorProvider.state).update((state) => Colors.amber);
    ref.read(solutionProvider.state).update((state) =>
        'Your best solution to stop being underweight is to focus on increasing calorie intake with nutrient-dense foods. Incorporate protein-rich sources like lean meats, nuts, and legumes. Engage in strength training exercises to build muscle mass and improve overall health.');
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    ref.read(statusProvider.state).update((state) => "Healthy");
    ref.read(statusColorProvider.state).update((state) => Colors.green);
    ref.read(solutionProvider.state).update((state) =>
        'You are healthy! But if you want to continue keeping a healthy weight, you should start a balanced diet comprising fruits, vegetables, whole grains, lean proteins, and healthy fats. Regular exercise, such as 150 minutes of moderate-intensity aerobic activity per week, enhances cardiovascular health and helps manage stress. Strength training contributes to overall fitness.');
  } else if (bmi >= 25 && bmi <= 29.9) {
    ref.read(statusProvider.state).update((state) => 'Overweight');
    ref.read(statusColorProvider.state).update((state) => Colors.red);
    ref.read(solutionProvider.state).update((state) =>
        'There are ways to cut being overweight such as creating a calorie deficit through a balanced diet and regular exercise. Be mindful of portion sizes and reduce the consumption of sugary and processed foods. Incorporate moderate-intensity exercises like brisk walking and cycling to burn excess calories.');
  } else if (bmi >= 30) {
    ref.read(statusProvider.state).update((state) => 'Obese');
    ref.read(statusColorProvider.state).update((state) => Colors.redAccent);
    ref.read(solutionProvider.state).update((state) =>
        'Addressing obesity requires professional guidance and lifestyle changes. Seek advice from healthcare professionals or registered dietitians to develop a personalized weight loss plan. Adopt a balanced diet that promotes sustained weight loss while providing essential nutrients. Regular exercise combining cardio and strength training enhances metabolism and overall fitness.');
  }
}
