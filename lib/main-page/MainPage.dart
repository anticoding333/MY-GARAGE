import 'package:flutter/material.dart';
import 'MainPageUtils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "images/logo.png",
                width: 200,
                height: 200,
              ),
              MainButton(
                name: "Students",
                onPressed: () {},
              ),
              SizedBox(
                width: 5,
              ),
              MainButton(
                name: "Employees",
                onPressed: () {},
              ),
              SizedBox(
                width: 5,
              ),
              MainButton(
                name: "Guests",
                onPressed: () {},
              ),
            ],
          ),
          Image.asset(
            "images/test.png",
            width: 200,
            height: 200,
          ),
          Container(
            width: 10,
            height: 10,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
