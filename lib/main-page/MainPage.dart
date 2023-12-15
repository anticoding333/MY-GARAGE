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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backround.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/logo.png",
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  width: 20,
                ),
                MainButton(
                  name: "Students",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/StudentsPage');
                  },
                ),
                SizedBox(
                  width: 35,
                ),
                MainButton(
                  name: "Employees",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/EmplyeesPage');
                  },
                ),
                SizedBox(
                  width: 25,
                ),
                MainButton(
                  name: "Guests",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/GuestsPage');
                  },
                ),
              ],
            ),
            Image.asset(
              "images/test.png",
              width: 200,
              height: 200,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
