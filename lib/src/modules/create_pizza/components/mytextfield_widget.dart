// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CreateTextField extends StatelessWidget {
  // final String hint;
  final TextEditingController? controller;
  final double horizontal;
  final double vertical;
  final double radius;
  final TextInputType? keyboardType;
  final String hint;
  final Widget? suffixIcon;
  final double? width;

  const CreateTextField({
    this.suffixIcon,
    this.width,
    super.key,
    required this.hint,
    required this.controller,
    required this.horizontal,
    required this.vertical,
    required this.radius,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
      ),
    );
  }
}
