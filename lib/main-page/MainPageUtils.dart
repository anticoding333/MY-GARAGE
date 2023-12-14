import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  MainButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
