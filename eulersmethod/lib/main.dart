import 'package:eulersmethod/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EulersMethodApp());
}

class EulersMethodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Euler's Method Solver",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
