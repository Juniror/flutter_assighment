import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.label,
    required this.placeholder,
    this.isPassword = false,
    required this.controller,
  });
  final String label;
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _isHidden = true;
  @override
  void initState() {
    super.initState();
    _isHidden = widget.isPassword;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: TextStyle(fontSize: 20, color: Colors.indigo),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            hintText: widget.placeholder,
            border: OutlineInputBorder(),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                  )
                : null,
          ),
          obscureText: _isHidden,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'กรุณากรอกข้อมูล';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
