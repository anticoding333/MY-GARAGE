import 'package:desktopapp/students-page/StudentsPageUtils.dart';
import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<String> students = ['Name', 'ID', 'License.NO', 'Car'].toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MainPage');
            },
            child: Icon(Icons.arrow_back),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  color: Colors.orange),
              width: 150,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: Colors.blue),
                  width: 130,
                  height: 130,
                  child: Center(
                    child: Text(
                      "Students",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                  ),
                ),
              ),
            )
          ],
        ),
        StudentGrid(
            name: 'Name', ID: 'ID', license_number: 'License.No#', car: 'Car')
      ]),
    );
  }
}
