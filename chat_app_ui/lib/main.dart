// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chat_app_ui/homepage/chatpage.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "chat app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        brightness: Brightness.light,
      ),
      home: mainpage(),
    );
  }
}
