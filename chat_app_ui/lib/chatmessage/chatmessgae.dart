import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  //const ChatMessage({Key? key}) : super(key: key);

  final String text;
  ChatMessage({required this.text});
  final String _s = "Devanshi";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(_s[0]),
            ),
          ),
          Column(
            children: <Widget>[
              Text(text, style: Theme.of(context).textTheme.subtitle1),
              Container(
                margin: EdgeInsets.only(top: 6),
                child: Text(""),
              )
            ],
          )
        ],
      ),
    );
  }
}
