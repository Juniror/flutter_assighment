import 'package:assighment/work2/Answer1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme:
            GoogleFonts.maliTextTheme(),
      ),
      title: 'Demo',
      home: Register(),
    );
  }
}
