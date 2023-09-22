// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_import

import 'dart:html';

import 'package:car_go/global/global.dart';
import 'package:car_go/screens/main_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmTextEditingController = TextEditingController();
  // ignore: prefer_final_fields
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailTextEditingController.text.trim(),
              password: passwordTextEditingController.text.trim())
          .then((auth) async {
        currentUser = auth.user;
        if (currentUser != null) {
          Map userMap = {
            "id": currentUser!.uid,
            "name": nameTextEditingController.text.trim(),
            "email": emailTextEditingController.text.trim(),
            "address": addressTextEditingController.text.trim(),
            "phone": phoneTextEditingController.text.trim(),
          };
          DatabaseReference userRef =
              FirebaseDatabase.instance.ref().child("users");
          userRef.child(currentUser!.uid).set(userMap);
        }
        await Fluttertoast.showToast(msg: "Successfully Registered");
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MainScreen()));
      }).catchError((errorMessage) {
        Fluttertoast.showToast(msg: "error Occured: \n$errorMessage");
      });
    } else {
      Fluttertoast.showToast(msg: "Not all fields are filled ");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            Column(children: [
              Image.asset(darkTheme ? 'images/dark.jpeg' : 'images/light.jpeg'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Register',
                style: TextStyle(
                  color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // ignore: body_might_complete_normally_nullable
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Name can't be empty";
                              }
                              if (text.length < 2) {
                                return "Please enter a valid name";
                              }
                              if (text.length > 49) {
                                return "Minimun length is 50 characters";
                              }
                            },
                            onChanged: (text) => setState(() {
                              nameTextEditingController.text = text;
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // ignore: body_might_complete_normally_nullable
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Email can't be empty";
                              }
                              if (EmailValidator.validate(text) == true) {
                                return "email entered";
                              }
                              if (text.length > 99) {
                                return "Minimun length is 100 characters";
                              }
                            },
                            onChanged: (text) => setState(() {
                              emailTextEditingController.text = text;
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          IntlPhoneField(
                            showCountryFlag: false,
                            dropdownIcon: Icon(
                              Icons.arrow_drop_down,
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey,
                            ),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: darkTheme
                                  ? Colors.black45
                                  : Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  )),
                            ),
                            initialCountryCode: 'BD',
                            onChanged: (text) => setState(() {
                              phoneTextEditingController.text =
                                  text.completeNumber;
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                            decoration: InputDecoration(
                                hintText: "Address",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // ignore: body_might_complete_normally_nullable
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Address can't be empty";
                              }
                              if (EmailValidator.validate(text) == true) {
                                return "Please enter a valid address";
                              }
                              if (text.length > 99) {
                                return "Minimun length is 100 characters";
                              }
                            },
                            onChanged: (text) => setState(() {
                              addressTextEditingController.text = text;
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: !_passwordVisible,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: darkTheme
                                          ? Colors.amber.shade400
                                          : Colors.grey,
                                    ))),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // ignore: body_might_complete_normally_nullable
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Password can't be empty";
                              }
                              if (text.length < 6) {
                                return "Please enter a valid password";
                              }
                              if (text.length > 49) {
                                return "Minimun length is 50 characters";
                              }
                              return null;
                            },
                            onChanged: (text) => setState(() {
                              passwordTextEditingController.text = text;
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: !_passwordVisible,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: darkTheme
                                          ? Colors.amber.shade400
                                          : Colors.grey,
                                    ))),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // ignore: body_might_complete_normally_nullable
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Confirm Password can't be empty";
                              }
                              if (text.length < 6) {
                                return "Please enter a valid password";
                              }
                              if (text != passwordTextEditingController.text) {
                                return "Passwords do not match ";
                              }
                              if (text.length > 49) {
                                return "Minimun length is 50 characters";
                              }
                              return null;
                            },
                            onChanged: (text) => setState(() {
                              confirmTextEditingController.text = text;
                            }),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: darkTheme
                                    ? Colors.amber.shade400
                                    : Colors.blue,
                                onPrimary:
                                    darkTheme ? Colors.black : Colors.white,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                minimumSize: Size(double.infinity, 40)),
                            onPressed: () {
                              _submit();
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: darkTheme
                                    ? Colors.amber.shade400
                                    : Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  " Sign In",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
