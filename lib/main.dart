import 'package:flutter/material.dart';
import 'package:responsi/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TPM Tugas 4',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins-Regular',
      ),
      home: const LoginPage(),
    );
  }
}