// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'dart:html';

import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  //mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  var num1 = 0, num2 = 0, sum = 0;
  final TextEditingController t1 = TextEditingController(text: " ");
  final TextEditingController t2 = TextEditingController(text: " ");

  void add() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void sub() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void mul() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void div() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = (num1 ~/ num2);
    });
  }

  void clear() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      t1.text = " ";
      t1.text = " ";
      sum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATOR"),
      ),
      body: Container(
          padding: EdgeInsets.only(
            top: 200.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "OUTPUT : $sum",
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.light,
                  controller: t1,
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                TextField(
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.light,
                  controller: t2,
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          add();
                        },
                        child: Text("Add")),
                    Padding(padding: EdgeInsets.all(4)),
                    ElevatedButton(
                        onPressed: () {
                          sub();
                        },
                        child: Text("Sub")),
                    Padding(padding: EdgeInsets.all(4)),
                  ],
                ),
                Padding(padding: EdgeInsets.all(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          div();
                        },
                        child: Text("Div")),
                    Padding(padding: EdgeInsets.all(4)),
                    ElevatedButton(
                        onPressed: () {
                          mul();
                        },
                        child: Text("Mul")),
                    Padding(padding: EdgeInsets.all(4)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          clear();
                        },
                        child: Text("clear")),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
