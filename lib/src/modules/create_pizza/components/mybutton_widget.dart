import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final double radius;
  const CreateButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        onPressed: onPressed,
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
