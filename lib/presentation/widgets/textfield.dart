import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText, border: const OutlineInputBorder()),
    );
  }
}