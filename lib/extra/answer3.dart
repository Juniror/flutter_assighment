import 'package:flutter/material.dart';

class Answer3 extends StatefulWidget {
  const Answer3({super.key});

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  int _baseprice = 150;
  bool _vaccum = false;
  bool _wax = false;

  @override
  Widget build(BuildContext context) {
    int total = _baseprice;
    if (_vaccum) {
      total += 50;
    }
    if (_wax) {
      total += 100;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณค่าบริการล้างรถ"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownMenu<int>(
              label: const Text("ขนาดรถ"),
              initialSelection: _baseprice,
              expandedInsets: EdgeInsets.zero,
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 150, label: "รถเล็ก (Small)"),
                DropdownMenuEntry(value: 200, label: "รถเก๋ง (Medium)"),
                DropdownMenuEntry(value: 250, label: "รถ SUV/กระบะ (Large)"),
              ],
              onSelected: (value) {
                setState(() {
                  _baseprice = value!;
                });
              },
            ),
          ),
          CheckboxListTile(
            title: const Text("ดูดฝุ่น (+50 บาท)"),
            value: _vaccum,
            onChanged: (value) {
              setState(() {
                _vaccum = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("เคลือบเงา (+100 บาท)"),
            value: _wax,
            onChanged: (value) {
              setState(() {
                _wax = value!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "ราคารวม: $total บาท",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
