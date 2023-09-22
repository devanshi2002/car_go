// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

final LocalAuthentication _localAuthentication = LocalAuthentication();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Authentication App',
      theme: ThemeData(primaryColor: Colors.green[400]),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _canCheckBiometric = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _avialableBiometric = List<BiometricType>.empty();
  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listOfBiometrics = [];
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _avialableBiometric = listOfBiometrics;
    });
  }

  Future<void> authorizedNow() async {
    bool isAuthorized = false;
    try {
      isAuthorized = await _localAuthentication.authenticateWithBiometrics(
          localizedReason: "please authenticate to complete your transaction",
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      if (isAuthorized)
        _authorizedOrNot = "authorized";
      else
        _authorizedOrNot = "not authorized";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 120.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("FACIAL ID AND FINGER PRINT SCANNER"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" Can we check the Biometric:$_canCheckBiometric"),
              ElevatedButton(
                onPressed: () {
                  _checkBiometric;
                },
                child: Text(
                  "Check biometric ",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[100],
                ),
              ),
              Text(" List of Biometric:${_avialableBiometric.toString()}"),
              ElevatedButton(
                onPressed: () {
                  _getListOfBiometricTypes;
                },
                child: Text(
                  "List of  biometrics ",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[100],
                ),
              ),
              Text(" Can we check the Biometric:$_authorizedOrNot"),
              ElevatedButton(
                onPressed: () {
                  authorizedNow;
                },
                child: Text(
                  "Authorize now                 ",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[100],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
