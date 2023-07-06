import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    required this.obscureText,
    required this.label,
    this.icon,
    this.validator,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String label;
  final Widget? icon;
  final dynamic validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: icon,
        label: Text(label),
      ),
    );
  }
}
