import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    this.controller,
    required this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
      validator: validator,
    );
  }
}
