import 'package:desktopapp/employee-page/EmployeesPageUtils.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  List<String> students = ['Name', 'ID', 'License.NO', 'Car'].toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 15,
          ),
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
              width: 200,
              height: 90,
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
                      "Employees",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          height: 1,
          alignment: Alignment.center,
          color: Colors.black,
        ),
        SizedBox(
          height: 10,
        ),
        EmployeesGrid(
            name: 'Name', ID: 'ID', license_number: 'License.No#', car: 'Car')
      ]),
    );
  }
}
