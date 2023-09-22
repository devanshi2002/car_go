// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, file_names, unused_local_variable

import 'package:chat_app/ChatScreen.dart';
import 'package:chat_app/Models/fav_contact.dart';
import 'package:chat_app/Models/message_model.dart';
import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class RecentChats extends StatefulWidget {
  RecentChats({Key? key}) : super(key: key);

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.0),
                topRight: Radius.circular(60.0))),
        child: Column(
          children: [
            FavContacts(),
            Expanded(
              child: Container(
                // height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0)),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message chat = chats[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(user: chat.sender),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 7.0, bottom: 7.0, right: 10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 2.0),
                            decoration: BoxDecoration(
                                color: chat.unread
                                    ? Colors.orange[50]
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                          AssetImage(chat.sender.imageUrl),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(chats[index].sender.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.0,
                                                  color: Colors.grey)),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                chat.text,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(chat.time,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Colors.grey)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: chat.unread
                                            ? Container(
                                                width: 60,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(2.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(7.0),
                                                  child: Text(
                                                    "new",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                            : Text(""),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
