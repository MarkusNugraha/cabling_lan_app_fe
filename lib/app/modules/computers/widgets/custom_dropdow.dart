import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final int? selectedId;
  final String dropdownKey;
  final List<DropdownMenuItem<int>> items;
  final ValueChanged<int?>? onChanged;
  final bool isMandatory;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.selectedId,
    required this.dropdownKey,
    required this.items,
    required this.onChanged,
    this.isMandatory = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField<int>(
        key: ValueKey(dropdownKey),
        initialValue: selectedId,
        validator: isMandatory
            ? (value) {
                if (value == null) return ' ';
                return null;
              }
            : null,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          errorStyle: const TextStyle(fontSize: 0, height: 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
        style: const TextStyle(fontSize: 14, color: Colors.black),
        isExpanded: true,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
