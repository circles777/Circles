import 'dart:html';

import 'package:flutter/material.dart';

class TextFormWithOutLine extends StatelessWidget {
  final String hintText;
  final Function? onChanged;
  final String? validationText;
  final FunctionStringCallback? validator;
  const TextFormWithOutLine(
      {super.key,
      required this.hintText,
      this.onChanged,
      this.validationText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged!(value),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          isDense: true,
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey))),
      maxLines: 1,
      validator: (value) {
        if (validator != null) {
          validator!(value!);
        }
        if (value == null || value.isEmpty) {
          return 'Please enter ${validationText != null ? validationText : 'some text'}';
        }
        return null;
      },
    );
  }
}
