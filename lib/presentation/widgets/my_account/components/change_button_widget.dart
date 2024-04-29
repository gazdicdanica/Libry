import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class ChangeButtonWidget extends StatelessWidget {
  const ChangeButtonWidget({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: darkGreenColor,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        backgroundColor: Colors.transparent
      ),
      onPressed: onPressed,
      child: Text(t.change,
          key: K.changeTheme,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}
