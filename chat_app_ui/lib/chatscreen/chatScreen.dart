// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chat_app_ui/chatmessage/chatmessgae.dart';

class chatScreen extends StatefulWidget {
  chatScreen({Key? key}) : super(key: key);

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController t1 = new TextEditingController();
  void _handleSubmitted(String text) {
    t1.clear();
    ChatMessage message = ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
          constraints: BoxConstraints(minHeight: 32.0, maxHeight: 108.0),
          margin: EdgeInsets.symmetric(vertical: 6.0),
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
          ),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  controller: t1,
                  //onSubmitted: _handleSubmitted,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _handleSubmitted(t1.text);
                  },
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Flexible(
        child: ListView.builder(
          padding: EdgeInsets.all(7.0),
          reverse: true,
          itemCount: _messages.length,
          itemBuilder: (_, int index) {
            return _messages[index];
          },
        ),
      ),
      Divider(
        height: 1.0,
      ),
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: _textComposer(),
      )
    ]);
  }
}
