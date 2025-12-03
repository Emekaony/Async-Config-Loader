import 'package:flutter/material.dart';

class GenericTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final TextStyle textStyle;
  const GenericTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}
