import 'package:flutter/material.dart';

class GuestGrid extends StatelessWidget {
  final String name;
  final String ID;
  final String license_number;
  final String car;

  GuestGrid({
    Key? key,
    required this.name,
    required this.ID,
    required this.license_number,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 60,
          color: Colors.orangeAccent,
          child: Text(name),
          alignment: Alignment.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 60,
          color: Colors.orangeAccent,
          child: Text(ID),
          alignment: Alignment.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 60,
          color: Colors.orangeAccent,
          child: Text(license_number),
          alignment: Alignment.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 60,
          color: Colors.orangeAccent,
          child: Text(car),
          alignment: Alignment.center,
        ),
      ),
    ]);
  }
}
