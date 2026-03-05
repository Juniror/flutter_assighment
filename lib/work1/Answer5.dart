import 'package:assighment/work1/Answer2.dart';
import 'package:assighment/work1/Answer3.dart';
import 'package:assighment/work1/Answer4.dart';
import 'package:assighment/work1/answer1.dart';
import 'package:flutter/material.dart';

class Answer5 extends StatelessWidget {
  const Answer5({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("My Answer"), centerTitle: true,backgroundColor: Colors.orange,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Answer1()),
                  ),
                },
                child: Text("Answer1"),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Answer2()),
                  ),
                },
                child: Text("Answer2"),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Answer3()),
                  ),
                },
                child: Text("Answer3"),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Answer4()),
                  ),
                },
                child: Text("Answer4"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
