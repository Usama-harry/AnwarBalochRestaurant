import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;
  final String? Function(String?) validator;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isObsecure = false,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
      ),
    );
  }
}
