import 'package:flutter/material.dart';

void showMySnackBar(BuildContext context, Color color, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
