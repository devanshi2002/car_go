import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'x.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    ReadJson();
    super.initState();
  }

  List<data> datalist = [];

  Future<void> ReadJson() async {
    final String response = await rootBundle.loadString('x.json');
    final d = await jsonDecode(response);
    datalist = new List.empty();
    d.forEach((e) {
      data newData = new data();
      newData = data.fromMap(e);
      datalist.add(newData);
    });
    print(datalist);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        //   child: Center(
        // child: FutureBuilder(
        //   future:
        //       DefaultAssetBundle.of(context).loadString('load_json/person.json'),
        //   builder: (context, snapshot) {
        //     var mydata = jsonDecode(snapshot.data.toString());
        //     return ListView.builder(
        //       itemCount: mydata == null ? 0 : mydata.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Card(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.stretch,
        //             children: <Widget>[
        //               Text("name: " + mydata[index]['name']),
        //               Text("age: " + mydata[index]['age']),
        //               Text("height : " + mydata[index]['height']),
        //               Text("gender: " + mydata[index]['gender']),
        //               Text("hair_color: " + mydata[index]['hair_color']),
        //             ],
        //           ),
        //         );
        //       },
        //     );
        //   },
        // ),

        );
  }
}
