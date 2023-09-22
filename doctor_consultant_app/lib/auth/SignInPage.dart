// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, prefer_const_constructors

import 'package:doctor_consultant_app/WelcomeScreen.dart';
import 'package:doctor_consultant_app/auth/authentication_screen.dart';
import 'package:doctor_consultant_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
 //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? _email;
    String _password;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          "assets/Sign_Up_bg.svg",
          fit: BoxFit.fill,
        ),
        Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: defaultPadding * 6),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFieldName(text: "Email"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFormField(
                        validator:
                            EmailValidator(errorText: "EMAIL IS REQUIRED "),
                        onSaved: (email) => _email = email!,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "email@gmail.com",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFieldName(text: "Password"),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "PASSWORD IS REQUIRED"),
                            onSaved: (password) => _password = password!,
                            onChanged: (pass) => _password = pass,
                            decoration: InputDecoration(
                              hintText: "******",
                              hintStyle: TextStyle(color: Colors.grey),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(top: defaultPadding * 6),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: BorderSide(color: Colors.white)),
                            ),
                            onPressed: () {
                              
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WelcomeScreen();
                              }));
                            },
                            child: Text(
                              "Done",
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
