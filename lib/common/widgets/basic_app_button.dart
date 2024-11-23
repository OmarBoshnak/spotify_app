import 'package:flutter/material.dart';

Widget basicAppButton({
  required VoidCallback onPressed,
  required String title,
  double? height,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 88),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
