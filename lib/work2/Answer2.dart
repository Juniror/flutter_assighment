import 'package:flutter/material.dart';

class Accept extends StatelessWidget {
  const Accept({
    super.key,
    required this.username,
    required this.password,
    required this.name,
    required this.lastname,
  });
  final String username;
  final String password;
  final String name;
  final String lastname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ข้อมูลที่กรอกมา"), centerTitle: true),
      backgroundColor: Colors.blueAccent.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: [
              SizedBox(height: 30),
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              SizedBox(height: 16),
              Text(
                "สมัครสมาชิกเรียบร้อยแล้ว",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ชื่อผู้ใช้: $username", style: TextStyle(fontSize: 18)),
                  Text(
                    "รหัสผ่าน: ${'*' * password.length}",
                    style: TextStyle(fontSize: 18),
                  ),
                  Divider(),
                  Text("ชื่อ: $name", style: TextStyle(fontSize: 18)),
                  Divider(),
                  Text("นามสกุล: $lastname", style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
