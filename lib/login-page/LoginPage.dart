import 'dart:io';

import 'package:desktopapp/students-page/StudentsPage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DataBaseHelper db = DataBaseHelper.instance;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo2.png",
                width: 100,
                height: 100,
              ),
              Container(
                width: 2,
                height: 88,
                color: Colors.black,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "MYGARAGE",
                style: TextStyle(
                    color: Color(0xff020219),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 400,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 125,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/MainPage");
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

