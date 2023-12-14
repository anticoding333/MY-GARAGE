import 'package:desktopapp/login-page/LoginPage.dart';
import 'package:desktopapp/main-page/MainPage.dart';
import 'package:desktopapp/students-page/StudentsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/LoginPage': (context) => const LoginPage(),
        '/MainPage': (context) => const MainPage(),
        '/StudentsPage': (context) => const StudentsPage(),
      },
    );
  }
}
