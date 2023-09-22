// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyApp",
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
        accentColor: Colors.red,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String _errorMessage = '';
  final _formKey = GlobalKey<FormState>();
  bool _passwordvisible = false;
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;
  // @override

  @override
  bool visible() {
    return !_passwordvisible;
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() {
      this.setState(() {});
    });
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      // appBar: AppBar(
      //   title: Text(
      //     "Calculator",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("images/1.png"),
            fit: BoxFit.contain,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
            //  height: 200,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 50,
              ),
              Form(
                //key: _formKey,
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.white))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   " Email",
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      Padding(padding: EdgeInsets.all(2)),
                      TextFormField(
                        // onChanged: (val) {
                        //   validateEmail(val);
                        // },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter the email",
                          // hintStyle: TextStyle(color: Colors.white),
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.light,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter password",
                          hintStyle: TextStyle(color: Colors.white),
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: visible(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

//   void validateEmail(String val) {
//     if (val.isEmpty) {
//       setState(() {
//         _errorMessage = "Email can not be empty";
//       });
//     } else if (!EmailValidator.validate(val, true)) {
//       setState(() {
//         _errorMessage = "Invalid Email Address";
//       });
//     } else {
//       setState(() {
//         _errorMessage = "";
//       });
//     }
//   }
// }
}
