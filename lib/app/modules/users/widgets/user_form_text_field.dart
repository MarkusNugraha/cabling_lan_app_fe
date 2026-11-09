import 'package:flutter/material.dart';

class UserFormTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEnabled;
  final bool isReadOnly;
  final bool obscureText;
  final bool isMandatory;

  const UserFormTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.isMandatory,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: isMandatory ? 0 : 5),
          child: Row(
            children: [
              isMandatory
                  ? const Text('*', style: TextStyle(color: Colors.red))
                  : const Text(''),
              const SizedBox(width: 2),
              Text(label, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
        const SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: TextFormField(
            controller: controller,
            validator: isMandatory && !isReadOnly
                ? (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '$label is required.';
                    }
                    return null;
                  }
                : null,
            enabled: isEnabled,
            readOnly: isReadOnly,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
