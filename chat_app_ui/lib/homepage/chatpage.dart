// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chat_app_ui/chatscreen/chatScreen.dart';

class mainpage extends StatefulWidget {
  mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FRENZY CHAT",
          textAlign: TextAlign.center,
        ),
      ),
      body: chatScreen(),
    );
  }
}
