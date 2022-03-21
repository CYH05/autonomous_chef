import 'package:flutter/material.dart';

Widget customTextFormField({
  TextEditingController? controller,
  required String label,
  required String? Function(String?) validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      label: Text(label),
    ),
    validator: validator,
  );
}
