import 'package:flutter/material.dart';
import 'package:flutter_api/view/login.dart';

void main() {
  runApp(const CallApi());
}

class CallApi extends StatelessWidget {
  const CallApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
