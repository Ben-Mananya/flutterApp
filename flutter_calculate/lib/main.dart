import 'package:flutter/material.dart';
import 'package:flutter_calculate/calculate.dart';


void main() {
  runApp(CalculateApp());
}
class CalculateApp  extends StatelessWidget {
  const CalculateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeCalculate(),
    );
  }
}

