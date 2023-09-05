import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final int? maxlines;
  const TextFieldWidget(
      {super.key, required this.controller, required this.labelText,this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText, border: const OutlineInputBorder()),
          maxLines: maxlines,
    );
  }
}