import 'package:flutter/material.dart';

class UserFormTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;
  final bool obscureText;

  const UserFormTextField({
    super.key,
    required this.label,
    required this.controller,
    this.enabled = true,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(label, style: const TextStyle(fontSize: 15)),
        ),
        const SizedBox(height: 3),
        TextField(
          controller: controller,
          enabled: enabled,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
