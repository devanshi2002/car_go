// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_app/Models/fav_contact.dart';
import 'package:chat_app/Models/message_model.dart';
import 'package:chat_app/RecentChats.dart';
import 'package:chat_app/category_selector.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu_outlined,
            size: 20.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "Chats",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                size: 30.0,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          CategorySelector(),
          RecentChats(),
        ],
      ),
    );
  }
}
