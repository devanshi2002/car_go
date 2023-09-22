import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "retrive the data using http",
      )),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, index) {
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      child: Container(
                        child: const Text("shckshcskuh"),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
