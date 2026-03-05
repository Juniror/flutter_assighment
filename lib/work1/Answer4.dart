import 'package:flutter/material.dart';

class Answer4 extends StatelessWidget {
  const Answer4({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Profile PAge"), centerTitle: true),
        body: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 42, backgroundColor: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      "User Name",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.mail, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("user@example.com"),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("123-456-7890"),
                        ],
                      ),
                      SizedBox(height: 12),

                      Row(
                        children: [
                          Icon(Icons.gps_fixed, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("123 Main Street"),
                        ],
                      ),
                    ],
                  ),
               
                ],
              ),
            ),
               Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom:12 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text("Edit Profile"),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text("Log out"),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
