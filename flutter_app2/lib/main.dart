import 'package:flutter/material.dart';
import 'package:flutter_app2/view/Homepage.dart';

void main() {
  runApp(QuickApp());
}


class QuickApp extends StatelessWidget {
  const QuickApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
