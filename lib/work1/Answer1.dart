import 'package:assighment/work1/Components/Blocks.dart';
import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Grid Layout"),centerTitle: true,backgroundColor: Colors.orange,),
        body: Column(
          children: [
            Blocks(
              color1: Colors.red,
              color2: Colors.green,
              color3: Colors.blue,
            ),
            Blocks(
              color1: Colors.orange,
              color2: Colors.purple,
              color3: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
