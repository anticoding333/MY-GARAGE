import 'package:flutter/material.dart';

class EmployeesGrid extends StatelessWidget {
  final String name;
  final String ID;
  final String license_number;
  final String car;

  const EmployeesGrid({
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
          alignment: Alignment.center,
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Colors.orangeAccent,
          alignment: Alignment.center,
          child: Text(
            ID,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Colors.orangeAccent,
          alignment: Alignment.center,
          child: Text(
            license_number,
            style: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Colors.orangeAccent,
          alignment: Alignment.center,
          child: Text(
            car,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }
}
