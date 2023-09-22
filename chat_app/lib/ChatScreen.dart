// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, file_names

import 'package:chat_app/Models/message_model.dart';
import 'package:chat_app/Models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required this.user}) : super(key: key);
  late final User user;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: isMe
                  ? EdgeInsets.only(top: 6, bottom: 8, left: 70.0)
                  : EdgeInsets.only(
                      top: 6,
                      bottom: 8,
                    ),
              height: 110.0,
              decoration: BoxDecoration(
                  color: isMe ? Colors.red[100] : Colors.orange[50],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                      bottomLeft: Radius.circular(60.0))),
              child: Container(
                margin: EdgeInsets.only(left: 7.0, bottom: 8.0),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.time,
                        style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          message.text,
                          style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: message.isLiked
                  ? Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border_outlined, size: 30))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          elevation: 0.0,
          title: Container(
              alignment: Alignment.center, child: Text(widget.user.name)),
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 100.0,
          actions: [
            // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () {},
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0))),
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.only(top: 10),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  final bool isMe =
                      (message.sender.ID == currentUser.ID ? true : false);
                  return _buildMessage(message, isMe);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
