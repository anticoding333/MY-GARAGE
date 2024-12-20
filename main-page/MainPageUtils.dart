import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const MainButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xFF5ddce2),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
