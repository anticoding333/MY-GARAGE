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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              MainButton(
                name: "Employees",
                onPressed: () {},
              ),
              MainButton(
                name: "Guests",
                onPressed: () {},
              ),
              SizedBox(
                width: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
