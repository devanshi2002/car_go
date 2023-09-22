import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Calculator_app(),
  ));
}

class Calculator_app extends StatefulWidget {
  Calculator_app({Key? key}) : super(key: key);

  @override
  State<Calculator_app> createState() => _Calculator_appState();
}

class _Calculator_appState extends State<Calculator_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Color.fromARGB(255, 208, 212, 215),
          )),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    child: Text("1"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromRadius(20),
                      shape: CircleBorder(),
                    )),
              ),
              Expanded(
                child: ElevatedButton(
                    child: Text("1"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromRadius(20),
                      shape: CircleBorder(),
                    )),
              ),
              Expanded(
                child: ElevatedButton(
                    child: Text("1"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromRadius(20),
                      shape: CircleBorder(),
                    )),
              ),
              Expanded(
                child: ElevatedButton(
                    child: Text("1"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromRadius(20),
                      shape: CircleBorder(),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
