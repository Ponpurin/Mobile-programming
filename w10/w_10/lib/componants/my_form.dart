import 'package:flutter/material.dart';

import 'input_with_error_text.dart';

class MyForm extends StatelessWidget {
  InputWithErrorText input;
  final bool hideText;
  final String labelText;
  final TextInputType textInputType;
  MyForm(
      {Key? key,
      required this.input,
      required this.hideText,
      required this.labelText,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: TextField(
        obscureText: hideText,
        onChanged: (value) {
          input.valueText = value;
        },
        decoration: InputDecoration(
          labelText: labelText,
          errorText: input.errorText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
