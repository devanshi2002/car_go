import 'dart:io';

import 'package:chat_app/Models/user_model.dart';
import 'package:flutter/material.dart';

class Message {
  late final User sender;

  late final String time;
  bool isLiked;
  bool unread;
  late final String text;
  late final int ID;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
    required this.ID,
  });
}

final User greg = User(ID: 1, name: "greg", imageUrl: "assets/1.jpg");
final User dev = User(ID: 2, name: "dev", imageUrl: "assets/2.jpg");
final User akshat = User(ID: 3, name: "akshat", imageUrl: "assets/3.jpg");
final User harshh = User(ID: 4, name: "harshh", imageUrl: "assets/4.jpg");
final User baby = User(ID: 5, name: "baby", imageUrl: "assets/5.jpg");
final User james = User(ID: 6, name: "akshat", imageUrl: "assets/3.jpg");
final User surbhi = User(ID: 7, name: "james", imageUrl: "assets/3.jpg");
final User currentUser = User(ID: 8, name: "Me", imageUrl: "assets/3.jpg");

List<User> favorites = [greg, dev, akshat, harshh, baby];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    ID: 0,
    sender: dev,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 8,
    sender: surbhi,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 1,
    sender: greg,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 3,
    sender: dev,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    ID: 1,
    sender: akshat,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 4,
    sender: harshh,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    ID: 5,
    sender: baby,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    ID: 1,
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    ID: 8,
    sender: currentUser,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 0,
    sender: dev,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 8,
    sender: surbhi,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 1,
    sender: greg,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    ID: 4,
    sender: dev,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    ID: 1,
    sender: akshat,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    ID: 4,
    sender: harshh,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: false,
  ),
  Message(
    ID: 8,
    sender: baby,
    time: '12:30 PM',
    text: 'Hey, how\'s it going?',
    isLiked: false,
    unread: false,
  ),
  Message(
    ID: 1,
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];
