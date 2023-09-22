import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KAUSHALYA",
      theme: ThemeData(
        accentColor: Colors.greenAccent,
        brightness: Brightness.dark,
      ),
      home: LoginPage(),
    );
  }
}
