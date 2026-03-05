import 'package:flutter/material.dart';

class Blocks extends StatelessWidget {
  final Color? color1;
  final Color? color2;
  final Color? color3;

  const Blocks({super.key, this.color1, this.color2, this.color3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),  
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 120,                  
              color: color1,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 120,
              color: color2,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 120,
              color: color3,
            ),
          ),
        ],
      ),
    );
  }
}