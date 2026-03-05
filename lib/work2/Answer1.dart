import 'package:assighment/work2/Answer2.dart';
import 'package:assighment/work2/Components/Input.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "สมัครสมาชิก",
                      style: TextStyle(fontSize: 24, color: Colors.indigo),
                    ),
                  ),
                  Input(
                    label: "ชื่อผู้ใช้",
                    placeholder: "กรุณากรอกชื่อผู้ใช้",
                    isPassword: false,
                    controller: usernameController,
                  ),
                  Input(
                    label: "รหัสผ่าน",
                    placeholder: "กรุณากรอกรหัสผ่าน",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  Input(
                    label: "ยืนยันรหัสผ่าน",
                    placeholder: "กรุณากรอกรหัสผ่าน",
                    isPassword: true,
                    controller: confirmPasswordController,
                  ),
                  Input(
                    label: "ชื่อ",
                    placeholder: "กรุณากรอกชื่อ",
                    isPassword: false,
                    controller: nameController,
                  ),
                  Input(
                    label: "นามสกุล",
                    placeholder: "กรุณากรอกนามสกุล",
                    isPassword: false,
                    controller: lastnameController,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Accept(
                              username: usernameController.text,
                              password: passwordController.text,
                              name: nameController.text,
                              lastname: lastnameController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text("สมัครสมาชิก", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
