import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  const Answer2({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Social Media Post"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 32, backgroundColor: Colors.blue),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Username"), Text("5 minute ago")],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(height: 300, width: width, color: Colors.grey),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => {}, child: Text("Like")),
                  ElevatedButton(onPressed: () => {}, child: Text("Comment")),
                  ElevatedButton(onPressed: () => {}, child: Text("Share")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
