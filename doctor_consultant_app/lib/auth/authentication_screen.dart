// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:doctor_consultant_app/WelcomeScreen.dart';
import 'package:doctor_consultant_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpPage extends StatelessWidget {
  // const SignUpPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/Sign_Up_bg.svg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Spacer(),
                    Text(
                      "Create Account ",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),

                    Row(
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text("Sign In!",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)))
                      ],
                    ),
                    SignUpForm(
                      formkey: _formKey,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(defaultPadding * 2),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF255ED6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(color: Colors.black)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            } else
                              print("it didnt sign up ");
                          },
                          child: Text("Sign Up"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key, required this.formkey}) : super(key: key);
  final GlobalKey formkey;
  late final String _username, _email, _phonenumber, _password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFieldName(text: "UserName"),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFormField(
            validator: RequiredValidator(errorText: "USER NAME IS REQUIRED"),
            onSaved: (username) => _username = username!,
            decoration: InputDecoration(
                hintText: "username@123",
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFieldName(text: "Email"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFormField(
            validator: EmailValidator(errorText: "EMAIL IS REQUIRED "),
            onSaved: (email) => _email = email!,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "email@gmail.com",
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFieldName(text: "Phone"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFormField(
            validator:
                RequiredValidator(errorText: "Please enter your Phone number"),
            onSaved: (phone) => _phonenumber = phone!,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "000000000",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFieldName(text: "Password"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFormField(
            validator: RequiredValidator(errorText: "PASSWORD IS REQUIRED"),
            onSaved: (password) => _password = password!,
            onChanged: (pass) => _password = pass,
            decoration: InputDecoration(
              hintText: "******",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            obscureText: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFieldName(text: "Confirm Password"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextFormField(
            validator: (pass) =>
                MatchValidator(errorText: "Enter the password entered above")
                    .validateMatch(pass!, _password),
            decoration: InputDecoration(
                hintText: "*********",
                hintStyle: TextStyle(color: Colors.grey)),
            obscureText: true,
          ),
        ),
      ]),
    );
  }
}

class TextFieldName extends StatelessWidget {
  TextFieldName({Key? key, required this.text}) : super(key: key);
  late final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
    );
  }
}
