import 'package:flutter/material.dart';

class Anima extends StatefulWidget {
  Anima({Key? key}) : super(key: key);

  @override
  _AnimaState createState() => _AnimaState();
}

class _AnimaState extends State<Anima> {
  int activeIndex = 0;

  final List<Color> activeColors = [Colors.red, Colors.yellow, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Traffic Light'),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              3,
              (index) => activeIndex == index ? AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 500),
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: activeColors[index]),
              ) : AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 500), 
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: activeColors[index].withValues(alpha: 0.3)),
              ),
            ),
            ElevatedButton(onPressed: ()=>{
              setState(() {
                activeIndex = (activeIndex + 1) % 3;
              })
            }, child: Text("Change Color"))
          ],
        ),
      ),
    );
  }
}
