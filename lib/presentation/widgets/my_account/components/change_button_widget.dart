import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class ChangeButtonWidget extends StatelessWidget {
  const ChangeButtonWidget({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            t.change,
            style: const TextStyle(color: darkGreenColor, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
