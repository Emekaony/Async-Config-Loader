import 'package:flutter/material.dart';

class GenericInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoCorrect;
  final String? hintText;
  final bool isObscureTextField;
  final FormFieldValidator<String>? validator;

  const GenericInputField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.autoCorrect = false,
    this.isObscureTextField = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureTextField,
      autocorrect: autoCorrect,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(color: Colors.black, width: 2.0),
        // ),
        // // when the user has tapped into it
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(color: Colors.black, width: 2.0),
        // ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
