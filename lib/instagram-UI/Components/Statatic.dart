import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Statatic extends StatelessWidget {
  const Statatic({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(title), Text(Math.Random().nextInt(1000).toString())],
      ),
    );
  }
}
