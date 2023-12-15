import 'package:flutter/material.dart';

class EmployeesGrid extends StatelessWidget {
  final String name;
  final String ID;
  final String license_number;
  final String car;

  EmployeesGrid({
    Key? key,
    required this.name,
    required this.ID,
    required this.license_number,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Colors.orangeAccent,
          child: Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          alignment: Alignment.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Colors.orangeAccent,
          child: Text(
            ID,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          alignment: Alignment.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Colors.orangeAccent,
          child: Text(
            license_number,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          alignment: Alignment.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Colors.orangeAccent,
          child: Text(
            car,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          alignment: Alignment.center,
        ),
      ),
    ]);
  }
}
