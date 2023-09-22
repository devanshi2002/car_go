// ignore_for_file: prefer_const_constructors

import 'dart:io';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _loading = true;
  late File _image;
  final imagepicker = ImagePicker();
  List _predictions = [];
  @override
  void initState() {
    super.initState();
    loadmodel();
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.45,
        imageStd: 127.45);
    setState(() {
      _loading = false;
      _predictions = prediction!;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadimage_fromgallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
  }

  _loadimage_fromcamera() async {
    var i = await imagepicker.getImage(source: ImageSource.camera);
    if (i == null) {
      return null;
    } else {
      _image = File(i.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            "MASK DETECTION",
            style: GoogleFonts.cairo(),
          ),
        ),
      ),
      body: Container(
          height: h,
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 80),
                height: 100,
                width: 100,
                child: Image.asset('assets/m.jpeg'),
                //color: Colors.red,
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                child: Text(" ML Classifier",
                    style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      _loadimage_fromgallery();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      "Upload from gallery ",
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold, color: Colors.cyan[300]),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      _loadimage_fromcamera();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      "Capture from camera ",
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold, color: Colors.cyan[300]),
                    )),
              ),
              _loading == false
                  ? Container(
                      height: 200,
                      width: 200,
                      child: Image.file(_image),
                    )
                  : Container()
            ],
          )),
    );
  }
}
