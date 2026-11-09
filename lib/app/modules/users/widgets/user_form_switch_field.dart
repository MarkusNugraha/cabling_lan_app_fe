import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormSwitchField extends StatelessWidget {
  final String label;
  final RxBool value;
  final bool isEnabled;

  const UserFormSwitchField({
    super.key,
    required this.label,
    required this.value,
    this.isEnabled = true,
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
        Obx(
          () => Switch(
            value: value.value,
            onChanged: isEnabled ? (newValue) => value.value = newValue : null,
          ),
        ),
      ],
    );
  }
}
