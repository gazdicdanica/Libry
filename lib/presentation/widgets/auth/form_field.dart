import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String? errorText;
  final bool obscureText;

  const CustomFormField({super.key, 
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    this.suffixIcon,
    this.errorText,
    this.obscureText = false

  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: widget.errorText,
      ),
      keyboardType: widget.labelText.toLowerCase().contains('email') ? TextInputType.emailAddress : TextInputType.text,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      obscureText: widget.obscureText,
      validator: widget.validator,
    );
  }
}
