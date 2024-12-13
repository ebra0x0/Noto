import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Noto/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    required this.maxWords,
    required this.textSize,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

  final String? hint;
  final int? maxWords;
  final double textSize;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Don’t skip this one!';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: null,
      inputFormatters: [LengthLimitingTextInputFormatter(maxWords)],
      style: TextStyle(fontSize: textSize),
      decoration: InputDecoration(
        hintText: hint,
        errorStyle: const TextStyle(color: Color.fromARGB(255, 200, 0, 0)),
        hintStyle: TextStyle(
          color: Colors.grey.shade300,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
