import 'package:flutter/material.dart';

class StudentGrid2 extends StatelessWidget {
  final String name;
  final String ID;
  final String license_number;
  final String car;
  final String location;
  final String amount;

  const StudentGrid2({
    Key? key,
    required this.name,
    required this.ID,
    required this.license_number,
    required this.car,
    required this.location,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Color.fromARGB(255, 255, 207, 144),
          alignment: Alignment.center,
          child: Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Color.fromARGB(255, 255, 207, 144),
          alignment: Alignment.center,
          child: Text(
            ID,
            style: const TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Color.fromARGB(255, 255, 207, 144),
          alignment: Alignment.center,
          child: Text(
            license_number,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Color.fromARGB(255, 255, 207, 144),
          alignment: Alignment.center,
          child: Text(
            car,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Color.fromARGB(255, 255, 207, 144),
          alignment: Alignment.center,
          child: Text(
            location,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          width: 150,
          color: Color.fromARGB(255, 255, 207, 144),
          alignment: Alignment.center,
          child: Text(
            amount,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    ]);
  }
}